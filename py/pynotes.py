debug:
    import pdb;
    pdb.set_trace()


dynamic typing

---------------------------------------------
http://docs.python.org/3/tutorial/index.html

Python intepreter
  easily extended with new functions and data types implemented in C or C++
    http://docs.python.org/3/extending/index.html#extending-index
    http://docs.python.org/3/c-api/index.html#c-api-index

extensive standard library
  http://docs.python.org/3/library/index.html#library-index

standard objects and modules
  http://docs.python.org/3/library/index.html#library-index
  http://docs.python.org/3/reference/index.html#reference-index

---------------------------

python shell,
python -c command [arg] ...,
python -m module [arg] ...

import sys
  sys.argv[0] is "-c",
  sys.argv[0[ is "module"
  sys.argv[1*] for ...


#!/usr/bin/python -tt

UTF-8,
# -*- coding: encoding -*-
convention: the standard library only uses ASCII characters for identifiers 

PYTHONSTARTUP=
  startup file in interactive mode

also see sitecustomize and usercustomize:
  

If you want to use the startup file in a script, you must do this explicitly in the script:
import os
filename = os.environ.get('PYTHONSTARTUP')
if filename and os.path.isfile(filename):
    exec(open(filename).read())

version:
>>> import sys
>>> print(sys.version)


--------------------

_:
  last printed expression
  read only

numbers:
  int, float, Decimal, Fraction, complex(real, [imag])

strings:
  cannot be changed
  "" or ''
  len(s)
  print(r''): raw
  multi lines: """...""" or '''...'''
  +: concat
  *: repeat
  [postive]: index
             [0]: first character
  [negative]: backward index
              [-1]: last character
  [i:j]: range
         i or j can be omitted
  +---+---+---+---+---+---+
  | P | y | t | h | o | n |
  +---+---+---+---+---+---+
  0   1   2   3   4   5   6
 -6  -5  -4  -3  -2  -1
  
lists:
  can be changed
  comma-separated
  l = [1, 8, 27, 65, 125]
  l[3] = 64
  .append(item): add an item
  .insert(index, item): insert an item
  del l[index]: delete an item
  len(l)

multiple assignment:
  a, b = 0, 1
  a, b = b, a+b
  
--------------------------

prompt an integer input:
  x = int(input("Please enter an integer: "))


range()

pass:
  no op statement

in:
  tests whether or not a sequence contains a certain value

-----------------------

define a function:
  def
  
arguments are passed using call by value (where the value is always an object reference, not the value of the object).

called using keyword arguments:
  kwarg=value

default argument values:
  def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):

  The default values are evaluated once at the point of function definition in the defining scope
  i = 5
  def f(arg=i):
    print(arg)

  i = 6
  f()
  5

mapping types - dict:
  def cheeseshop(kind, *arguments, **keywords):
    for arg in arguments:
      print(arg)
    keys = sorted(keywords.keys())
    for kw in keys:
      print(kw, ":", keywords[kw])


arbitrary number of arguments:
  Any formal parameters which occur after the *args parameter are .keyword-only. arguments
    def concat(*args, sep="/"):

unpacking:
  unpack a list or dict/tuple for a function call requiring separate positional arguments.
  *list
  **dict

lambda:
  define a function object
  def make_incrementor(n):
     return lambda x: x + n

---------------

Python data types: list, tuple, set, dict
list:
  various functions: insert(), sort(), ...
  >>> squares = []
  >>> for x in range(10):
  ...     squares.append(x**2)
  ...
  squares = [x**2 for x in range(10)]
  squares = list(map(lambda x: x**2, range(10)))
  [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
  for i, v in enumerate(list):
    enumerate() returns position and value pairs in i, v.

  from math import pi
  [str(round(pi, i)) for i in range(1, 6)]

  To loop over two or more sequences at the same time, the entries can be paired with the zip() function.
    questions = ['name',     'quest',          'favorite color']
    answers =   ['lancelot', 'the holy grail', 'blue']
    for q, a in zip(questions, answers): pass

list_creation:
    fr_str_L = s.split('#')
    by_range_L= range(5)
    nhan_zeros= [0]*5
    nhan_foos=  [foo]*8
    cong_L= [0,1,2] + [3,4]
    range_4= L[-1]
    three= L[-2]
    zero_1= L[:2]
    two_3_4= L[2:]
    one_2_3= L[1:4]
    del(L[1])
    listoflists=[ [0]*4 ]*5


nested list:
  [[row[i] for row in matrix] for i in range(4)]
    the outer[]: 4 items
    the nth inner[]: print the nth column of each row

list as stack:
  .append(i)
  .pop()

list as queue:
  from collections import deque
  queue = deque(["Eric", "John", "Michael"])
  .append(i)
  .popleft()

tuple:
  consists of a number of values separated by commas
  cannot be changed; like string, tuple is immutable. 
  0 or 1 items:
    empty = ()
    singleton = 'hello',    # <-- note trailing comma
  t = 12345, 54321, 'hello!'
  x, y, z = t
    unpacking

set:
  an unordered collection with no duplicate elements
  set('')
  {}
  a = {x for x in 'abracadabra' if x not in 'abc'}
  
dictionary:
  indexed by keys (immutable typed)
    Tuples can be used as keys if they contain only strings, numbers, or tuples;
  unique key: value pairs
  {}
  dict([('','')])
  .keys()
  .items()
  del
  {x: x**2 for x in (2, 4, 6)}

-----------------------------

conditions:
  while, if:
    any operators
  in, not in:
    value in a sequence?
  is, is not:
    same object?
  a < b == c:
    tests whether a is less than b and moreover b equals c
  not, and, or:
    A and not B or C is equivalent to (A and (not B)) or C

  Comparing Sequences and Other Types:
    lexicographical ordering
    (1, 2, 3)              < (1, 2, 4)
    [1, 2, 3]              < [1, 2, 4]
    'ABC' < 'C' < 'Pascal' < 'Python'
    (1, 2, 3, 4)           < (1, 2, 4)
    (1, 2)                 < (1, 2, -1)
    (1, 2, 3)             == (1.0, 2.0, 3.0)
    (1, 2, ('aa', 'ab'))   < (1, 2, ('abc', 'a'), 4)


----------------------------------------------
module is a file. package is a collection of modules.
When you import FooPackage, Python searches the directories on PYTHONPATH until it finds a file called FooPackage.py or a directory called FooPackage containing a file called __init__.py. However, having found the package directory, it does not then scan that directory and automatically import all .py files.

sys.path for default load paths

help('modules'): available modules
dir('<module name>'): members in a module

-----------------------------
By default, all objects in Python are True. Containers and numbers are False if the container is empty or if
the number is equal to zero. In addition, there is an object, None, that is always False

-----------------------------
example of dot file:
digraph {
rankdir = "LR"
edge [color="blue", fontsize=10];
xxx -> yyy;
...
node [shape="box"]
"a, b, c" -> xy [label="9"];
...
}

The dot file can be converted to an image using:
$ dot -Tsvg kap.dot -o kap.svg

-------------------------------
docstrings:

-----------------------------
The primary looping idioms in Python are
for x    in s: ...
for x, y in zip(s, t): ...
for x    in reversed(s): ...
for i, x in enumerate(s): ...
for x    in sorted(s): ...

------------------------------
module os:
  file names, command line arguments, environment variables
  process parameters
  file object creation
  file descriptor operations
  files and directories
  process management
  interface to the scheduler

-------------------------------

PDB debugger:
  python -m pdb <.py>

logging:
  import logging
  logging.basicConfig(filename='example.log',level=logging.DEBUG)
  logging.info(msg)
  logging.debug(msg)
  logging.error(msg)
  logging.critical(msg)
  logging.warn(msg)
  
----------------------------
URL:
import urllib
u = urllib.urlopen(url)
data = u.read()

----------------------------
networking:
from socket import *

client:
s = socket(AF_INET, SOCK_STREAM)
s.connect(('www.python.org', 80))
request = 'GET /index.html HTTP/1.1\nHost: www.python.org\nConnection: close\n\n'
s.send(request)
d = s.recv(20000)

server:
s = socket(AF_INET,SOCK_STREAM)
s.bind(('', 9000))
s.listen(5)
print 'Server up, running, and waiting for call'
try:
  while True:
    c,a = s.accept()    c,a are connection,address
    handler(c, a)
  finally:
    s.close()

------------------------------
threading:
import threading
c,a = s.accept()
threading.Thread(target=handler, args=(c, a)).start()

process:
import os
c,a = s.accept()
pid = os.fork()
if pid == 0:
  # We must be the clone
  handler(c, a)
  os._exit(0)

------------------------------
# Search a directory tree for all files with duplicate content
hashmap = {} # content signature -> list of matching filenames
for path, dirs, files in os.walk('.'):
  for filename in files:
    fullname = os.path.join(path, filename)
    d = open(fullname).read()
    h = hashlib.md5(d).hexdigest()
    hashmap.setdefault(h, []).append(fullname)
pprint.pprint(hashmap)

------------------------------

Protocols:
  Database API specification:
    Common interfaces to many varietires of SQL
  Hashlib common interface (md5, sha1, etc)
  Compression interface (compress/decompress)
  Conversion protocols (pickle, json, marshal):
    loads() and dumps()
  WSGI:
    The Web Server Gateway Interface is a simple and universal interface between web servers and web applications or frameworks for the Python programming language.
  File API (read files, stringIO, etc):
    open, write, read, readline

Solid foundation: lists and dicts, memory
management, exceptions, first-class feautures,
and overridable syntax
Iterator Protocol
Generators
List comps, set comps, dict comps, and genexps
Decorators
Introspection and Abstract Base Classes
Exec, eval(), and type()
With-statement
Indentation

--------------------------------
Overridable syntax:
[ ] __getitem__
. __getattribute__
+ __add__


Iterables:
  strings, lists, sets, dicts, collections,
  files, open urls, csv readers, itertools, etc
Things that consume iterators:
  for-loops, min,
  max, sorted, sum, set, list, tuple, dict, itertools
Can be chained together like Unix pipes and filters

--------------------

generator:
  yeild keyword
  Remembers state between invocations:
    the stack including open loops and trystatements;
    the execution pointer; and local variables

----------------------------

Makes it possible to generate new code on the fly
(timeit and namedtuple both use this technique)

type() lets code create new classes on the fly

----------------------
magic methods:

special methods:

with expression [as variable]:
  expression is evaluated, and it should result in an object that supports the context management protocol.
  with open('/etc/passwd', 'r') as f:

  lock = threading.Lock()
  with lock:
----------------------
list comprehension [simple], ...[if], [->list]
vec= [2, 4, 6]
[3*x for x in vec]
[3*x for x in vec if x > 3 ]

list comprehension [->list]
[ [x, x**2] for x in vec]

dict comprehension [->dict]
l1=1,2,3;   l2=6,7,8
{        k:v*2  for k,v in zip(l1,l2) }
dict( [ (k,v*2) for k,v in zip(l1,l2) ]   )
# { 1:6, 2:7, 3:8 }

list comprehension [->tuple l1,l2]
[ {x:y} for x in l1 for y in l2 ]
# [ {1:6}, {1:7}, {1:8}, {2:6}, {2:7}, {2:8}, {3:6}, {3:7}, {3:8} ]

