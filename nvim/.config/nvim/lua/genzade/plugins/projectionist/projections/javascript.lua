M = {}

M.javascript_generic = {
  ['src/*.js'] = {
    alternate = 'test/{}.test.js',
    type = 'source',
  },
  ['test/*.test.js'] = {
    alternate = 'src/{}.js',
    type = 'test',
    template = {
      "describe('{camelcase|capitalize|colons}', () => {",
      "  it('does something', () => {",
      '    expect(true).toBe(false)',
      '  })',
      '})',
    },
  },
}

return M
