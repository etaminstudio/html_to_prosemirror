RSpec.describe HtmlToProsemirror::Marks::Link do
  it "renders links correctly" do
    html = '<a href="https://input.com">Example Link</a>';
    json = {
      type: 'doc',
      content: [{
        type: 'text',
        text: 'Example Link',
        marks: [{
          type: 'link',
          attrs: {
            href: 'https://input.com'
          }
        }]
      }]
    }

    renderer = HtmlToProsemirror::Renderer.new()
    expect(json).to eq renderer.render(html)
  end

  it "preserves spaces between inline elements inside a link" do
    html = '<p><a href="https://example.com"><em>Foo</em> and <em>Bar</em> </a>baz</p>'
    link_mark = { type: 'link', attrs: { href: 'https://example.com' } }
    json = {
      type: 'doc',
      content: [{
        type: 'paragraph',
        content: [{
          type: 'text',
          text: 'Foo',
          marks: [link_mark, { type: 'italic' }]
        }, {
          type: 'text',
          text: ' and ',
          marks: [link_mark]
        }, {
          type: 'text',
          text: 'Bar',
          marks: [link_mark, { type: 'italic' }]
        }, {
          type: 'text',
          text: ' ',
          marks: [link_mark]
        }, {
          type: 'text',
          text: 'baz'
        }]
      }]
    }
    renderer = HtmlToProsemirror::Renderer.new
    expect(json).to eq renderer.render(html)
  end
end
