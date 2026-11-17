module counter_top (clock_i,
    enable_i,
    reset_n_i,
    counter_value_o);
 input clock_i;
 input enable_i;
 input reset_n_i;
 output [7:0] counter_value_o;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire _32_;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net1;
 wire net2;
 wire clknet_0_clock_i;
 wire clknet_1_0__leaf_clock_i;
 wire clknet_1_1__leaf_clock_i;

 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_104 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_138 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_172 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_206 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_24 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_240 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_274 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_0_308 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_32 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_324 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_328 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_36 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_0_70 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_0_8 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_10_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_10_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_10_171 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_10_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_10_206 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_244 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_10_247 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_10_265 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_10_297 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_10_313 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_10_317 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_10_325 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_10_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_10_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_10_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_11_112 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_128 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_136 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_11_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_158 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_166 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_168 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_11_177 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_193 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_197 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_11_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_207 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_209 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_212 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_220 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_245 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_249 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_11_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_11_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_38 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_11_50 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_11_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_11_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_11_80 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_11_82 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_12_102 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_12_104 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_12_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_12_139 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_12_169 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_12_173 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_12_183 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_12_199 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_12_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_12_203 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_12_211 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_12_24 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_12_243 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_12_247 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_12_311 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_12_317 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_12_32 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_12_325 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_12_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_12_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_12_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_12_98 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_13_10 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_13_192 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_13_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_13_200 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_13_209 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_13_21 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_13_262 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_13_278 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_13_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_13_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_13_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_13_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_13_41 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_13_43 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_13_49 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_13_65 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_13_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_111 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_14_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_158 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_14_182 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_14_21 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_230 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_234 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_14_236 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_253 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_257 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_14_259 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_14_289 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_29 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_14_305 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_313 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_14_317 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_325 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_33 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_14_41 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_14_54 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_14_58 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_14_6 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_15_117 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_15_121 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_15_136 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_15_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_15_150 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_15_154 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_15_184 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_15_192 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_15_196 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_15_198 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_15_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_15_212 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_15_219 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_15_235 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_15_239 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_15_270 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_15_278 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_15_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_15_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_15_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_15_35 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_15_51 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_15_59 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_15_67 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_15_69 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_15_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_15_85 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_16_10 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_16_112 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_12 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_16_128 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_16_138 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_16_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_144 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_16_153 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_169 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_16_172 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_188 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_16_197 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_16_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_16_201 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_203 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_16_206 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_16_21 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_16_222 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_16_240 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_16_274 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_276 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_16_285 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_16_29 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_16_301 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_305 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_16_308 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_16_316 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_320 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_16_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_33 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_16_36 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_16_52 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_56 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_16_65 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_16_67 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_16_70 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_136 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_206 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_212 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_276 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_1_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_1_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_1_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_1_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_1_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_2_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_171 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_2_177 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_2_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_241 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_2_247 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_311 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_2_317 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_2_325 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_2_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_2_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_2_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_136 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_3_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_3_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_206 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_3_212 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_276 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_3_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_3_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_3_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_3_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_3_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_4_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_171 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_4_177 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_4_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_241 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_4_247 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_311 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_4_317 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_4_325 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_4_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_4_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_4_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_136 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_5_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_5_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_206 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_5_212 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_276 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_5_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_5_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_5_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_5_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_5_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_6_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_171 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_6_177 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_6_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_241 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_6_247 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_311 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_6_317 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_6_325 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_6_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_6_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_6_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_7_136 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_7_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_7_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_7_206 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_7_212 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_7_276 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_7_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_7_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_7_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_7_66 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_7_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_8_101 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_8_107 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_8_171 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_8_177 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_8_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_8_241 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_8_247 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_8_311 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_8_317 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_8_325 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_8_329 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_8_34 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_8_37 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_9_136 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_9_142 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_9_174 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_9_192 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_9_194 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_9_212 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_9_276 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_9_282 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_9_314 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_9_330 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_16 FILLER_9_40 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_9_56 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_9_64 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_9_68 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_64 FILLER_9_72 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_32 FILLER_9_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Left_17 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Right_0 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Left_27 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_10_Right_10 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Left_28 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_11_Right_11 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Left_29 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_12_Right_12 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Left_30 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_13_Right_13 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Left_31 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_14_Right_14 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Left_32 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_15_Right_15 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Left_33 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_16_Right_16 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Left_18 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Right_1 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Left_19 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Right_2 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Left_20 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Right_3 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Left_21 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Right_4 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Left_22 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Right_5 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Left_23 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Right_6 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Left_24 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Right_7 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Left_25 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Right_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Left_26 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Right_9 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_34 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_35 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_36 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_37 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_38 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_39 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_40 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_41 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_0_42 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_83 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_84 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_85 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_86 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_10_87 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_88 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_89 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_90 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_11_91 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_92 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_93 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_94 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_95 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_12_96 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_100 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_97 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_98 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_13_99 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_101 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_102 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_103 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_104 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_14_105 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_106 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_107 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_108 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_15_109 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_110 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_111 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_112 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_113 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_114 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_115 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_116 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_117 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_16_118 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_43 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_44 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_45 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_1_46 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_47 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_48 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_49 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_50 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_2_51 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_52 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_53 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_54 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_3_55 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_56 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_57 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_58 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_59 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_4_60 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_61 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_62 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_63 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_5_64 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_65 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_66 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_67 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_68 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_6_69 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_70 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_71 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_72 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_7_73 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_74 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_75 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_76 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_77 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_8_78 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_79 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_80 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_81 ();
 gf180mcu_fd_sc_mcu7t5v0__filltie TAP_TAPCELL_ROW_9_82 ();
 gf180mcu_fd_sc_mcu7t5v0__clkinv_2 _33_ (.I(net2),
    .ZN(_08_));
 gf180mcu_fd_sc_mcu7t5v0__and4_4 _34_ (.A1(net5),
    .A2(net1),
    .A3(net4),
    .A4(net3),
    .Z(_09_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _35_ (.A1(net6),
    .A2(_09_),
    .ZN(_10_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_4 _36_ (.A1(_08_),
    .A2(_10_),
    .ZN(_00_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _37_ (.A1(net7),
    .A2(_08_),
    .ZN(_11_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _38_ (.A1(net7),
    .A2(net2),
    .Z(_12_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _39_ (.A1(net6),
    .A2(_09_),
    .ZN(_13_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _40_ (.I0(_11_),
    .I1(_12_),
    .S(_13_),
    .Z(_14_));
 gf180mcu_fd_sc_mcu7t5v0__buf_4 _41_ (.I(_14_),
    .Z(_01_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _42_ (.A1(net8),
    .A2(_08_),
    .ZN(_15_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _43_ (.A1(net8),
    .A2(net2),
    .Z(_16_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _44_ (.A1(net7),
    .A2(net6),
    .A3(_09_),
    .ZN(_17_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _45_ (.I0(_15_),
    .I1(_16_),
    .S(_17_),
    .Z(_18_));
 gf180mcu_fd_sc_mcu7t5v0__buf_4 _46_ (.I(_18_),
    .Z(_02_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _47_ (.A1(net9),
    .A2(_08_),
    .ZN(_19_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _48_ (.A1(net9),
    .A2(net2),
    .Z(_20_));
 gf180mcu_fd_sc_mcu7t5v0__nand4_4 _49_ (.A1(net8),
    .A2(net7),
    .A3(net6),
    .A4(_09_),
    .ZN(_21_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _50_ (.I0(_19_),
    .I1(_20_),
    .S(_21_),
    .Z(_22_));
 gf180mcu_fd_sc_mcu7t5v0__buf_4 _51_ (.I(_22_),
    .Z(_03_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_1 _52_ (.A1(net10),
    .A2(_08_),
    .ZN(_23_));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _53_ (.A1(net10),
    .A2(net2),
    .Z(_24_));
 gf180mcu_fd_sc_mcu7t5v0__and4_1 _54_ (.A1(net9),
    .A2(net8),
    .A3(net7),
    .A4(net6),
    .Z(_25_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _55_ (.A1(_09_),
    .A2(_25_),
    .ZN(_26_));
 gf180mcu_fd_sc_mcu7t5v0__mux2_2 _56_ (.I0(_23_),
    .I1(_24_),
    .S(_26_),
    .Z(_27_));
 gf180mcu_fd_sc_mcu7t5v0__buf_4 _57_ (.I(_27_),
    .Z(_04_));
 gf180mcu_fd_sc_mcu7t5v0__xnor2_1 _58_ (.A1(net1),
    .A2(net3),
    .ZN(_28_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_2 _59_ (.A1(_08_),
    .A2(_28_),
    .ZN(_05_));
 gf180mcu_fd_sc_mcu7t5v0__nand2_1 _60_ (.A1(net1),
    .A2(net3),
    .ZN(_29_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _61_ (.A1(net4),
    .A2(_29_),
    .Z(_30_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_2 _62_ (.A1(_08_),
    .A2(_30_),
    .ZN(_06_));
 gf180mcu_fd_sc_mcu7t5v0__nand3_1 _63_ (.A1(net1),
    .A2(net4),
    .A3(net3),
    .ZN(_31_));
 gf180mcu_fd_sc_mcu7t5v0__xor2_1 _64_ (.A1(net5),
    .A2(_31_),
    .Z(_32_));
 gf180mcu_fd_sc_mcu7t5v0__nor2_4 _65_ (.A1(_08_),
    .A2(_32_),
    .ZN(_07_));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _66_ (.D(_02_),
    .CLK(clknet_1_1__leaf_clock_i),
    .Q(net8));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _67_ (.D(_03_),
    .CLK(clknet_1_1__leaf_clock_i),
    .Q(net9));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _68_ (.D(_04_),
    .CLK(clknet_1_1__leaf_clock_i),
    .Q(net10));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _69_ (.D(_05_),
    .CLK(clknet_1_0__leaf_clock_i),
    .Q(net3));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _70_ (.D(_06_),
    .CLK(clknet_1_0__leaf_clock_i),
    .Q(net4));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _71_ (.D(_07_),
    .CLK(clknet_1_0__leaf_clock_i),
    .Q(net5));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _72_ (.D(_00_),
    .CLK(clknet_1_0__leaf_clock_i),
    .Q(net6));
 gf180mcu_fd_sc_mcu7t5v0__dffq_1 _73_ (.D(_01_),
    .CLK(clknet_1_1__leaf_clock_i),
    .Q(net7));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_16 clkbuf_0_clock_i (.I(clock_i),
    .Z(clknet_0_clock_i));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_16 clkbuf_1_0__f_clock_i (.I(clknet_0_clock_i),
    .Z(clknet_1_0__leaf_clock_i));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_16 clkbuf_1_1__f_clock_i (.I(clknet_0_clock_i),
    .Z(clknet_1_1__leaf_clock_i));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input1 (.I(enable_i),
    .Z(net1));
 gf180mcu_fd_sc_mcu7t5v0__buf_1 input2 (.I(reset_n_i),
    .Z(net2));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output10 (.I(net10),
    .Z(counter_value_o[7]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output3 (.I(net3),
    .Z(counter_value_o[0]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output4 (.I(net4),
    .Z(counter_value_o[1]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output5 (.I(net5),
    .Z(counter_value_o[2]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output6 (.I(net6),
    .Z(counter_value_o[3]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output7 (.I(net7),
    .Z(counter_value_o[4]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output8 (.I(net8),
    .Z(counter_value_o[5]));
 gf180mcu_fd_sc_mcu7t5v0__buf_2 output9 (.I(net9),
    .Z(counter_value_o[6]));
endmodule
