// weaves
// @file json0.q

// Using javascript and JSON
// .j is included in the base runtime after 3.0

// This recreates some test data from the tutorial.
k).j.x:([]C:$`as`;b:01b;j:0N 2;z:0Nz,.z.z)

// Demonstrates how to go in and out of JSON.
.j.k .j.j .j.x

// note: you must use "" and not '' for JSON file keys.

// Using a file, convert 
voltage0: raze read0`:s0.json
voltage1: .j.k voltage0

// And make a table.
voltage1: flip (`sym0`v0)!(key voltage1; value voltage1)

// Calculate an increment using a prime
// I choose 53 because the Javascript chart can render in 50ms.
.dlt.n: 53
.dlt.r: (1%.dlt.n) * first 1#1_deltas voltage1[;`v0]
// Make a vector of increments to be added to a base.
.x.inc1: .dlt.r * til .dlt.n

// An increment method, using a global.
.x.cnt:0

// Modulo counter for a ramp
inc0: { .x.inc1 @ .x.cnt mod .dlt.n }

// Use that ramp as the argument to this.
// Make a function to add an increment and form a dictionary.
voltage2: { [x] (voltage1[;`sym0])! voltage1[;`v0] + x }

/

Reply to websocket via .z.ws

This section can be used with websocket.htm and websocket2.htm to test
that web-sockets works.

\

// You have to reply via .z.w when invoked.

// To use it indirectly, you can use an alias for late evaluation.

.x.w0:: .z.w

// So these response methods use the .x.w0 which evaluated.
.json.ws: { neg[.x.w0].j.j @[value;x;{`$ "'",x}] }

.echo.ws: { neg[.x.w0]@x }
.value.ws: { neg[.x.w0]@[.Q.s value@;x;{`"`'`"`,x,`"`\n`"`}]}

.echo0.ws: { neg[.x.w0]@voltage0 }
.echo1.ws: { neg[.x.w0]@.j.j @ voltage2 @ inc0[] }

// Any of these can now be used to serve the web-socket.
// Uncomment this to test in that configuration.
// .z.ws: .echo0.ws

/

This section uses .z.wo (websocket open) to capture the client handle.

\

// Store the connection id of the caller on connect() initiated by them.
.z.wo: { 0N!.Q.s1 .z.w; .x.w0: .z.w }

// So we store the client in .x.w0 as the functions above.

// We now pump data on .z.ts

// Check we have a client handle.
test0: { `w0 in key .x }

// Test, increment a global; scale, json and send.
// The scalar is a function fx
f1: { [x; fx] $[not test0[]; : ::; .x.cnt+:1]; fx @ x }

// Test the curried linkage works with this.
f2: f1[;.echo0.ws]

// Now use the ramp 
.z.ts: f1[;.echo1.ws]

// And reduce this and watch your CPU, it will be the browser that is displaying the graphic
// that will be using the processors.
system"t 200"

.sys.exit[0]

\


/  Local Variables: 
/  mode:q 
/  q-prog-args: "-p 5000 -c 200 120 -C 2000 2000 -load csvdb help.q -verbose -halt -quiet"
/  fill-column: 75
/  comment-column:50
/  comment-start: "/  "
/  comment-end: ""
/  End:
