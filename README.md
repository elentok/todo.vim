Todo.txt Vim Plugin
====================

Why did I write this plugin?
-----------------------------

I've been using todo.txt for a couple of weeks now with the todo.sh script,
I really like the concept, but it didn't feel like a perfect flow:

* Using the shell script felt weird:

  ```bash
    t do 29
    t add @context1 do something
  ```

* There wasn't an easy way to edit specific tasks.
* I have about 30-40 tasks in the file, but I usually work in a specific context or project,
  so I wanted to see just those tasks and edit them.

To solve these problems I added filtered view support:

```
:Todo @context1 +project1 keyword1
```

How does the filtered view work?
--------------------------------

* When you filter, it creates two files:

  * .todo.filtered.txt
  * .todo.unfiltered.txt
 
* When you save the filtered file it automatically merges both files into todo.txt

Features
---------
* Allows editing a filtered view of the tasks.
* Auto-complete for the `:Todo` command (projects and contexts).
* When adding a new line to the filtered view it automatically adds the filter string.
* Open urls/file-links in tasks.
* Syntax highlighting.
* Toggle task completion.
* It's standalone, doesn't require todo.sh.


Installation
------------

If you're using vundle just add this line and run `:BundleInstall`:

```vim
Bundle 'elentok/todo.vim'
```

Usage
------

* `:Todo` - open todo.txt
* `:Todo {filter}` - open the filtered view (filter can contain contexts, projects and keywords)

When editing:

* `=` - toggles a task complete state (adds `x yyyy-mm-dd` to the beginning of the line)
* `\\` - opens the link in the current task (either http://... or [/path/to/local/file]),
  uses `g:todo_open_command` (defaults to `open`).


Todo
-----
* When merging filtered view, check if the todo.txt has changed.
* Auto archive
* Support future tasks (t:...) in filter

