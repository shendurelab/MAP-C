SILENT_MODE
BLOCK_FILE jp_PsBbSbJ.concise.blc
MAX_NSEQ 50
MAX_INPUT_LEN 50
OUTPUT_FILE jp_PsBbSbJ.concise.ps
PORTRAIT
POINTSIZE 8
IDENT_WIDTH 12
X_OFFSET 2
Y_OFFSET 2
DEFINE_FONT 0 Helvetica		DEFAULT 
DEFINE_FONT 1 Helvetica		REL		0.75   
DEFINE_FONT 7 Helvetica		REL		0.6
DEFINE_FONT 3 Helvetica-Bold	DEFAULT    
DEFINE_FONT 4 Times-Bold    	DEFAULT   
DEFINE_FONT 5 Helvetica-BoldOblique	DEFAULT 
#
DEFINE_COLOUR 3  1 0.62 0.67	# Turquiose
DEFINE_COLOUR 4  1 1 0		# Yellow
DEFINE_COLOUR 5  1 0 0		# Red
DEFINE_COLOUR 7  1 0 1		# Purple
DEFINE_COLOUR 8  0 0 1		# Blue
DEFINE_COLOUR 9  0 1 0		# Green
DEFINE_COLOUR 10 0.41 0.64 1.00	# Pale blue 
DEFINE_COLOUR 11 0.41 0.82 0.67	# Pale green 
DEFINE_COLOUR 50 0.69 0.18 0.37	# Pink (helix)
DEFINE_COLOUR 51 1.00 0.89 0.00	# Gold (strand)
NUMBER_INT 10
SETUP
#
# Highlight specific residues.
# Avoid highlighting Lupas 'C' predictions by
# limiting the highlighting to the alignments 
Scol_CHARS	C 1 1 770 24   4
Ccol_CHARS	H ALL    5
Ccol_CHARS	P ALL    8
SURROUND_CHARS LIV   ALL
#
# Replace known structure types with whitespace
SUB_CHARS 1 25 770 34 H SPACE
SUB_CHARS 1 25 770 34 E SPACE
SUB_CHARS 1 25 770 34 - SPACE
STRAND 128 28 129
COLOUR_TEXT_REGION 128 28 129 28 51
STRAND 176 28 180
COLOUR_TEXT_REGION 176 28 180 28 51
STRAND 268 28 273
COLOUR_TEXT_REGION 268 28 273 28 51
STRAND 286 28 286
COLOUR_TEXT_REGION 286 28 286 28 51
STRAND 292 28 294
COLOUR_TEXT_REGION 292 28 294 28 51
STRAND 299 28 301
COLOUR_TEXT_REGION 299 28 301 28 51
STRAND 307 28 309
COLOUR_TEXT_REGION 307 28 309 28 51
STRAND 393 28 394
COLOUR_TEXT_REGION 393 28 394 28 51
STRAND 396 28 396
COLOUR_TEXT_REGION 396 28 396 28 51
STRAND 415 28 416
COLOUR_TEXT_REGION 415 28 416 28 51
STRAND 607 28 609
COLOUR_TEXT_REGION 607 28 609 28 51
STRAND 636 28 640
COLOUR_TEXT_REGION 636 28 640 28 51
HELIX 120 28 127
COLOUR_TEXT_REGION 120 28 127 28 50
HELIX 158 28 175
COLOUR_TEXT_REGION 158 28 175 28 50
HELIX 235 28 252
COLOUR_TEXT_REGION 235 28 252 28 50
HELIX 274 28 285
COLOUR_TEXT_REGION 274 28 285 28 50
HELIX 298 28 298
COLOUR_TEXT_REGION 298 28 298 28 50
HELIX 367 28 386
COLOUR_TEXT_REGION 367 28 386 28 50
HELIX 420 28 428
COLOUR_TEXT_REGION 420 28 428 28 50
HELIX 431 28 445
COLOUR_TEXT_REGION 431 28 445 28 50
HELIX 473 28 493
COLOUR_TEXT_REGION 473 28 493 28 50
HELIX 508 28 534
COLOUR_TEXT_REGION 508 28 534 28 50
HELIX 583 28 590
COLOUR_TEXT_REGION 583 28 590 28 50
HELIX 610 28 635
COLOUR_TEXT_REGION 610 28 635 28 50
HELIX 650 28 674
COLOUR_TEXT_REGION 650 28 674 28 50
HELIX 676 28 679
COLOUR_TEXT_REGION 676 28 679 28 50
HELIX 747 28 761
COLOUR_TEXT_REGION 747 28 761 28 50
STRAND 80 33 81
COLOUR_TEXT_REGION 80 33 81 33 51
STRAND 127 33 129
COLOUR_TEXT_REGION 127 33 129 33 51
STRAND 176 33 180
COLOUR_TEXT_REGION 176 33 180 33 51
STRAND 233 33 235
COLOUR_TEXT_REGION 233 33 235 33 51
STRAND 269 33 273
COLOUR_TEXT_REGION 269 33 273 33 51
STRAND 284 33 287
COLOUR_TEXT_REGION 284 33 287 33 51
STRAND 292 33 293
COLOUR_TEXT_REGION 292 33 293 33 51
STRAND 298 33 301
COLOUR_TEXT_REGION 298 33 301 33 51
STRAND 308 33 309
COLOUR_TEXT_REGION 308 33 309 33 51
STRAND 367 33 367
COLOUR_TEXT_REGION 367 33 367 33 51
STRAND 415 33 416
COLOUR_TEXT_REGION 415 33 416 33 51
STRAND 607 33 612
COLOUR_TEXT_REGION 607 33 612 33 51
STRAND 636 33 639
COLOUR_TEXT_REGION 636 33 639 33 51
HELIX 120 33 123
COLOUR_TEXT_REGION 120 33 123 33 50
HELIX 126 33 126
COLOUR_TEXT_REGION 126 33 126 33 50
HELIX 157 33 175
COLOUR_TEXT_REGION 157 33 175 33 50
HELIX 236 33 253
COLOUR_TEXT_REGION 236 33 253 33 50
HELIX 274 33 283
COLOUR_TEXT_REGION 274 33 283 33 50
HELIX 368 33 387
COLOUR_TEXT_REGION 368 33 387 33 50
HELIX 420 33 427
COLOUR_TEXT_REGION 420 33 427 33 50
HELIX 431 33 441
COLOUR_TEXT_REGION 431 33 441 33 50
HELIX 444 33 445
COLOUR_TEXT_REGION 444 33 445 33 50
HELIX 473 33 493
COLOUR_TEXT_REGION 473 33 493 33 50
HELIX 508 33 534
COLOUR_TEXT_REGION 508 33 534 33 50
HELIX 583 33 590
COLOUR_TEXT_REGION 583 33 590 33 50
HELIX 613 33 635
COLOUR_TEXT_REGION 613 33 635 33 50
HELIX 650 33 673
COLOUR_TEXT_REGION 650 33 673 33 50
HELIX 676 33 676
COLOUR_TEXT_REGION 676 33 676 33 50
HELIX 747 33 761
COLOUR_TEXT_REGION 747 33 761 33 50
STRAND 13 34 14
COLOUR_TEXT_REGION 13 34 14 34 51
STRAND 129 34 129
COLOUR_TEXT_REGION 129 34 129 34 51
STRAND 137 34 137
COLOUR_TEXT_REGION 137 34 137 34 51
STRAND 177 34 180
COLOUR_TEXT_REGION 177 34 180 34 51
STRAND 256 34 258
COLOUR_TEXT_REGION 256 34 258 34 51
STRAND 268 34 273
COLOUR_TEXT_REGION 268 34 273 34 51
STRAND 292 34 294
COLOUR_TEXT_REGION 292 34 294 34 51
STRAND 306 34 309
COLOUR_TEXT_REGION 306 34 309 34 51
STRAND 392 34 394
COLOUR_TEXT_REGION 392 34 394 34 51
STRAND 396 34 396
COLOUR_TEXT_REGION 396 34 396 34 51
STRAND 414 34 416
COLOUR_TEXT_REGION 414 34 416 34 51
STRAND 635 34 640
COLOUR_TEXT_REGION 635 34 640 34 51
HELIX 119 34 128
COLOUR_TEXT_REGION 119 34 128 34 50
HELIX 159 34 176
COLOUR_TEXT_REGION 159 34 176 34 50
HELIX 235 34 252
COLOUR_TEXT_REGION 235 34 252 34 50
HELIX 255 34 255
COLOUR_TEXT_REGION 255 34 255 34 50
HELIX 274 34 285
COLOUR_TEXT_REGION 274 34 285 34 50
HELIX 298 34 301
COLOUR_TEXT_REGION 298 34 301 34 50
HELIX 367 34 386
COLOUR_TEXT_REGION 367 34 386 34 50
HELIX 420 34 428
COLOUR_TEXT_REGION 420 34 428 34 50
HELIX 430 34 446
COLOUR_TEXT_REGION 430 34 446 34 50
HELIX 474 34 494
COLOUR_TEXT_REGION 474 34 494 34 50
HELIX 508 34 534
COLOUR_TEXT_REGION 508 34 534 34 50
HELIX 584 34 589
COLOUR_TEXT_REGION 584 34 589 34 50
HELIX 608 34 626
COLOUR_TEXT_REGION 608 34 626 34 50
HELIX 628 34 634
COLOUR_TEXT_REGION 628 34 634 34 50
HELIX 650 34 674
COLOUR_TEXT_REGION 650 34 674 34 50
HELIX 676 34 682
COLOUR_TEXT_REGION 676 34 682 34 50
HELIX 748 34 761
COLOUR_TEXT_REGION 748 34 761 34 50
