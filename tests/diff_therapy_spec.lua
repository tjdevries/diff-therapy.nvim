local dt = require "diff-therapy"

local eq = assert.are.same

describe("mergeconflict", function()
  describe("get_contents", function()
    it("should return the three splits, when no conflicts", function()
      local RUST_contents = [[fn main() {
    println!("Hello, this is the world!");
}]]

      local contents = dt.get_contents(vim.split(RUST_contents, "\n"))

      eq(contents.ours.lines, { "fn main() {", '    println!("Hello, this is the world!");', "}" })
      eq(contents.theirs.lines, { "fn main() {", '    println!("Hello, this is the world!");', "}" })
      eq(contents.base.lines, { "fn main() {", '    println!("Hello, this is the world!");', "}" })
    end)

    it("should return the three splits", function()
      local RUST_contents = [[fn main() {
<<<<<<< HEAD
    println!("Hello, this is the world!");
||||||| dfbeb76
    println!("Hello, world!");
=======
    println!("Hello, oh not conflict world!");
>>>>>>> master
}]]

      local contents = dt.get_contents(vim.split(RUST_contents, "\n"))

      eq(contents.ours.lines, { "fn main() {", '    println!("Hello, this is the world!");', "}" })
      eq(contents.theirs.lines, { "fn main() {", '    println!("Hello, oh not conflict world!");', "}" })
      eq(contents.base.lines, { "fn main() {", '    println!("Hello, world!");', "}" })

      -- eq(contents.ours.hunks, { { "fn main() {" }, { '    println!("Hello, this is the world!");' }, { "}" } })
      eq(contents.ours.hunks[3], contents.theirs.hunks[3])
    end)
  end)
end)
