Prepared by Austin Mordahl
2018-09-03

Last revised: 2018-09-03

# Purpose

The purpose of this document is to provide guidelines for classifying bugs. Hopefully, with the help of this document, two separate reviewers can reach the same classification on ambiguous bugs.

# Classifications

Initially, I used three separate classification levels: True, Technically True, and False. Technically True encompassed bugs that were, in short, true but not interesting (like a pointer initialized by calloc being potentially null).

However, I do not think this is a useful distinction. Therefore, at time of writing, I have decided to strike the 'Technically True' classification, and only use True and False classifications.

## What makes a report true?

A true bug report **correctly identifies a bug in the program which can cause a fault to occur under some theoretical operating condition.**

Something to pay attention to is the specific wording of the bug report. For example, a bug report saying that a pointer 'may' be null after being initialized with malloc is true. However, a bug report saying that a pointer 'is' null would be false if any valid execution path leads to the pointer being initialized.

# Guidelines for Frequently Encountered Bug Types

*This section will continue to be updated with more common bug types.*

## Null Dereference

A bug report which alerts that a pointer initialized with ` malloc`, `calloc`, `alloc`, or any variation of these functions is **true**. Why?
1. *Could a fault actually arise from this bug under realistic operating conditions?* Yes. If a memory leak elsewhere in the program caused the operating system's memory to run out, these allocations could fail.
2. *Could this bug be fixed?* Yes. A common technique for addressing this is to wrap `malloc`, `calloc`, etc. in a function that checks whether the allocation succeeded, or kills the program.

Following this path, a bug report which alerts that a pointer initialized with a function wrapping an allocator in this manner (for example, toybox using `xmalloc`, `xcalloc`, etc.) is **false**. Of course these functions could fail, but they are in themselves the fix to the bug.

A bug report which alerts that a pointer initialized as an out parameter in a function depends on the function. If there are appropriate checks within the function to ensure the pointer is initialized, then the report is false. If the function initializes the pointer with `malloc`, then by the discussion above, the report is true.

# Remarks

It is important to remember that these guidelines only apply to this specific paper. These are not guidelines for classifying bugs as a whole, but rather, designed to make our final reports consistent and our methodology replicable.
