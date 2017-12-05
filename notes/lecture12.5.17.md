## Closure
- A subprogram & the referencing environment where it was defined.
- The referencing environment is needed if the the program is called from any arbitrary point in the program.
> (Useful in languages that allow nested subprograms are static-scoped & allow subprograms to be returned from functions & assigned to variables.)

## Co-routines: (special subprograms)
- In contrast to *master-slave* relationship between caller & callee subprogram
- In coroutines -> caller & called coroutines are more equitable
  - Coroutines can have multiple entry points - controlled by coroutines.
  - Must maintain status between actuations.
- Because of box -> coroutines are history-sensitive &
  ∴ have static local variables
  - because of this -> invoking a coroutine is called a resume not a call

# Recall:
- Functions are values.
  - Function values have 2 parts:
    - *code* for the function
    - *environment* for the function that was current when we created the function.
    - code is evaluated using the environment.
    - can't access parts of pair separately.
  - The "pair" is called a function closure or *closure*.
    - The reason is: the code itself can free variables
    - (variables that are not bound inside the code so they need to be bound by some outer environment ∴ the closure carries with it the environment that provides all those bindings. A closure overall is "closed" -> it has everything it needs to produce a function given a function argument).

# The Rules
- all values (results) are objects
  1. Objects communicate with each other and we use them by calling their methods.
  2. Methods are like functions, but they belong to objects.
  3. Each object has a private state.
  4. Each object has a class - the class determines the objects behavior. The class defines the bodies of the methods that then belong to the object. (The class contains method definitions.)

# Ruby
- allows us to discuss some of the core concepts in OOP.
- contrast between functional programming vs. OOP.
- all values are objects -> even numbers
- class-based: every object has a class that determines behavior.
  - Like Java, unlike JavaScript.
  - Mixins (neither Java interfaces or C++ multiple inheritance)
- dynamically typed
- convenient reflection - run-time inspection of objects.
- very dynamic - can change classes during execution.
- blocks and libraries encourages lots of closure idioms.
- Syntax scoping rules, semantics of a "scripting language"
- variable "spring to life" on use
- very flexible arrays

## Ruby - not our focus
- Lots of support for string manipulation & regular expressions
- Popular for server-side applications (Ruby on Rails)
- Often - many ways to do same thing -

## Where Ruby fits:

|            | Dynamically Typed              | Statically Typed |
|------------|--------------------------------|------------------|
| Functional | Racket                         | SML              |
| OOP        | Ruby (No need to discuss types | Java             |

- Ruby is more extreme as OOP.
- Ruby only has private states & all we have in language are objects.

## How can we define a class in Ruby?

    class Name
        def method_name1 method_args1
            expression1
        end
        def method_name2 method_args2
           expression2
        end
    end

- class name must start with a capital (i.e. `class Name`)

### Example 1:

    class A
        def m1
            34
        end
        def m2(x,y)
            z = 7
            if x > y
                false
            else
                x + y * z
            end
        end
    end

- m2 -> dynamically typed
- Run: IRB

    IRB -> load "classes_object.rb"
    IRB -> A.new
        -> a = A.new
        -> 34
        -> a.m2(34)

### Example 2:

    class B
        def m1
            4
        end
        def m3 x
            x.abs * 2 + self.m1
        end
    end

- `x.abs` -> absolute value method
- Special word
  - "this object" - myself.
  - In this code, a method has been called in a method.
- Run: IRB

    IRB -> load "classes_object.rb"
        -> a = A.new
        -> b = B.new
        -> b.m1
        -> 4
        -> b.m2
        -> undefined("m2 not found in B")
        -> a = A.new
        -> a.m3
        -> undefined("m3 not found in A")
        -> b.m3 5
        -> 14 (5 * 2) + 4

### Example 3 (self example):

    class C
        def m1
            print "hi"
