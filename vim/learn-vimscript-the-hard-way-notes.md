# Notes from Learn Vimscript the Hard Way

https://learnvimscriptthehardway.stevelosh.com/

Current chapter: 03

Practice using vimrc in this folder:

```shell
$ vim --clean -u ./vimrc
```

---

# 1 Messages

Echo messages with `:echo`, persist in `:messages` stack with `:echom`

# 2 Setting Options

Boolean options like line numbers have on/off variants by prefixing `no`:

    :set number
    :set nonumber

Or by adding a bang:

    :set number!

Can query boolean options by prefixing a question mark:

    :set number?


