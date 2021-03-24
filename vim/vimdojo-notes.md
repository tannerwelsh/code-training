# Notes from vimdojo (Core Vim Course by Drew Neil)

---

append-to-line

- A;<esc>j.j.j.j
- /\n<enter>cgn;<enter><esc>....
- qaA;<esc>jq@a@@@@@@

pad-with-spaces

- V:s/+/ + /g
- can use f+ to get to first + on line, and then ;/, to move forward/back
  and then can use "s + " to make a repeatable change

confirm-substitution

- use the c flag for subsitute to require a Confirmation before each substitution
  eg :%s/content/copy/c

rinse-and-repeat

- can use :normal or :norm command to execute a normal command on every line selected in visual mode
- so can effectively repeat a command across many lines
- helpful remapping :xnoremap . :normal .<CR>

visual-vs-operator-1

- can use U and u to upper/lowercase in visual mode

visual-vs-operator-1

- gu is a normal mode command to lowercase
  e.g. "guit" will lowercase the contents of a tag
- gw wraps text at 80 columns
- heuristic: prefer {operator}{motion} over visual mode
- can use visual mode _inside_ 'normal' ex command, e.g. `:'<,'>normal vitu`

offset-to-append-1

- can use sub command with special char "&", which represents the matched text
  s/lang/&uage/g (& == lang)
- or can use offset in searching to determine where the cursor moves to when hitting n/N
  /lang/e => move cursor to the end of the match (see :help offset)
- can re-use search commands with a different offset with
  //e (or //s, or //+2, etc.)
  since // re-does the last search

macro-repeat-linewise-1

- helpful to _normalize the cursor_ when recording macros (i.e. always start at beginning of line with 0)
- can use ~ to toggle case in Vim
- if a macro fails on a line when using <nubmer>@<macro>, will stop there
- can use the :normal command in visual mode to execute a macro across selected lines
  :'<,'>normal @w
- if using this method (apply in visual mode w/ :normal), don't need to normalize cursor position b/c normal mode positions cursor at beginning of each line
  (so can omit 0 at beginning and j at end, for example)

macro-repeate-filewise-1

- argument list is set of files vim was launched with (but can be modified)
- can use :args to view * populate argument list
- can navigate through args with :next, :prev, :first, :last
- similarly, can navigate through buffers w/ :bnext, :bprev, etc.
- use @: to repeat last ex command
- use :argdo <cmd> to execute a command on every file in the :args list
  e.g. :argdo edit! to revert to last saved changes
- to run macro in parallel across all :args, use
  :argdo normal @w (or whatever macro identifier is used)
- tip: if recording the macro on the first file, make sure to revert the changes before running :argdo so that you don't apply the changes twice

macro-increment

- use <C-R>= to enter the expression register to write simple mathematical formulas and have vim evaluate them
- can also use :let to store local variables, like :let i=12
- can use functions in expression register, lots available (see :help function-list)

