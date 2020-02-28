module full_adder_4bit(input [3:0] a, b, input cin, output [3:0] s, output cout);

wire n1, n2, n3;

full_adder_c f1(.b(b[0]), .a(a[0]), .cin(cin), .s(s[0]), .cout(n1));
full_adder_b f2(.a(a[1]), .b(b[1]), .cin(n1), .s(s[1]), .cout(n2));
full_adder_c f3(a[2], b[2], n2, s[2], n3);
full_adder_b f4(a[3], b[3], n3, s[3], cout);

endmodule
