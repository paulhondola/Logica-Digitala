project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE ../verilog/AUTOMAT.v
set_global_assignment -name VERILOG_FILE ../verilog/SPAL.v
set_global_assignment -name VERILOG_FILE ../verilog/CLK_DIVIDER.v
set_global_assignment -name VERILOG_FILE ../verilog/SEVEN_SEGMENT.v
set_global_assignment -name SDC_FILE example1.sdc

set_global_assignment -name TOP_LEVEL_ENTITY AUTOMAT
set_location_assignment -to clk PIN_AH10
set_location_assignment PIN_P11 -to clk;

set_location_assignment PIN_A7 -to rst;
set_location_assignment PIN_F15  -to on_off;
set_location_assignment PIN_B14  -to speed;

set_location_assignment PIN_B11  -to led_speed;

set_location_assignment PIN_C17  -to stare[0];
set_location_assignment PIN_D17  -to stare[1];
set_location_assignment PIN_E16  -to stare[2];
set_location_assignment PIN_C16  -to stare[3];
set_location_assignment PIN_C15  -to stare[4];
set_location_assignment PIN_E15  -to stare[5];
set_location_assignment PIN_C14  -to stare[6];
set_location_assignment PIN_D15  -to stare[7];

load_package flow
execute_flow -compile

project_close
