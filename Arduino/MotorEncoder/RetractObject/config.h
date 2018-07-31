//Motor Config
#define pin_dcmoto_dir1 4
#define pin_dcmoto_dir2 5
#define pin_dcmoto_pwm_out 6
#define pin_dcmoto_encode1 3
#define pin_dcmoto_encode2 2

#define dcmoto_encoder_1_rev 1920


//PID config
float PID_Tunings[3]={0.1,0.05,0.05};
int PWMSkip = 50;
int Accuracy = 50;
