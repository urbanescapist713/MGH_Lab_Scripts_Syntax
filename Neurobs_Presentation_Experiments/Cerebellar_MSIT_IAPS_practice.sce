#NOTE: display size is 640 x 480 on old exptl laptop, so this expt is set to 640 x 480 to match.
#Numbers font = 36 in old expt
#Note: monitor's refresh rate is: 60Hz = 60 frames of data per second/1 per 16.7ms --> request desired duration - 16.7/2 = request desired duration - 8 for all durations

#Header
response_matching = simple_matching;
default_font = "Arial"; #Closest Font to old expt font which is Courier New bolded and consistent w/ Flanker
active_buttons = 15;
#2,5 = number 1; 3,6 = number 2; 4,7 = number 3
button_codes = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15;
stimulus_properties = subjectID,string, num_stim,string, pic_stim,string, interference,string, emotion,string, targ_buttons,string, pic_dur,string, stim_dur,string;
event_code_delimiter = ",";
response_logging = log_active;
#End Header	

#Begin SDL
begin;

#Create a 1D arrays with all the pictures and with the corresponding valence categories in the picure description. Separate into 3 arrays by valence.

array {
	bitmap { filename = "3053.bmp"; description = "Neg"; } neg;
	bitmap { filename = "1120.bmp"; description = "Neg"; };
	bitmap { filename = "3230.bmp"; description = "Neg"; };
	bitmap { filename = "3266.bmp"; description = "Neg"; };
	bitmap { filename = "3071.bmp"; description = "Neg"; };
	bitmap { filename = "9253.bmp"; description = "Neg"; };
	bitmap { filename = "6550.bmp"; description = "Neg"; };
	bitmap { filename = "3030.bmp"; description = "Neg"; };
	bitmap { filename = "9440.bmp"; description = "Neg"; };
	bitmap { filename = "3180.bmp"; description = "Neg"; };
	bitmap { filename = "2800.bmp"; description = "Neg"; };
	bitmap { filename = "9571.bmp"; description = "Neg"; };
	bitmap { filename = "2120.bmp"; description = "Neg"; };
	bitmap { filename = "6260.bmp"; description = "Neg"; };
	bitmap { filename = "9000.bmp"; description = "Neg"; };
	bitmap { filename = "3301.bmp"; description = "Neg"; };
	bitmap { filename = "3350.bmp"; description = "Neg"; };
	bitmap { filename = "9600.bmp"; description = "Neg"; };
	bitmap { filename = "6370.bmp"; description = "Neg"; };
	bitmap { filename = "3160.bmp"; description = "Neg"; };
	bitmap { filename = "6570.bmp"; description = "Neg"; };
	bitmap { filename = "2750.bmp"; description = "Neg"; };
	bitmap { filename = "9570.bmp"; description = "Neg"; };
	bitmap { filename = "9220.bmp"; description = "Neg"; };
} neg_pics_set;

array {
	bitmap { filename = "2620.bmp"; description = "Neu"; } neu;
	bitmap { filename = "7004.bmp"; description = "Neu"; };
	bitmap { filename = "7025.bmp"; description = "Neu"; };
	bitmap { filename = "7140.bmp"; description = "Neu"; };
	bitmap { filename = "2890.bmp"; description = "Neu"; };
	bitmap { filename = "7002.bmp"; description = "Neu"; };
	bitmap { filename = "1121.bmp"; description = "Neu"; };
	bitmap { filename = "2383.bmp"; description = "Neu"; };
	bitmap { filename = "2520.bmp"; description = "Neu"; };
	bitmap { filename = "2480.bmp"; description = "Neu"; };
	bitmap { filename = "6000.bmp"; description = "Neu"; };
	bitmap { filename = "2515.bmp"; description = "Neu"; };
	bitmap { filename = "2221.bmp"; description = "Neu"; };
	bitmap { filename = "2440.bmp"; description = "Neu"; };
	bitmap { filename = "2516.bmp"; description = "Neu"; };
	bitmap { filename = "7100.bmp"; description = "Neu"; };
	bitmap { filename = "2880.bmp"; description = "Neu"; };
	bitmap { filename = "2870.bmp"; description = "Neu"; };
	bitmap { filename = "2850.bmp"; description = "Neu"; };
	bitmap { filename = "1670.bmp"; description = "Neu"; };
	bitmap { filename = "2600.bmp"; description = "Neu"; };
	bitmap { filename = "2570.bmp"; description = "Neu"; };
	bitmap { filename = "7150.bmp"; description = "Neu"; };
	bitmap { filename = "2210.bmp"; description = "Neu"; };
} neu_pics_set;

array {
	bitmap { filename = "7501.bmp"; description = "Pos"; } pos;
	bitmap { filename = "8502.bmp"; description = "Pos"; };
	bitmap { filename = "5470.bmp"; description = "Pos"; };
	bitmap { filename = "2303.bmp"; description = "Pos"; };
	bitmap { filename = "4608.bmp"; description = "Pos"; };
	bitmap { filename = "5621.bmp"; description = "Pos"; };
	bitmap { filename = "5001.bmp"; description = "Pos"; };
	bitmap { filename = "5831.bmp"; description = "Pos"; };
	bitmap { filename = "8500.bmp"; description = "Pos"; };
	bitmap { filename = "2550.bmp"; description = "Pos"; };
	bitmap { filename = "8185.bmp"; description = "Pos"; };
	bitmap { filename = "5480.bmp"; description = "Pos"; };
	bitmap { filename = "5622.bmp"; description = "Pos"; };
	bitmap { filename = "8200.bmp"; description = "Pos"; };
	bitmap { filename = "1440.bmp"; description = "Pos"; };
	bitmap { filename = "2080.bmp"; description = "Pos"; };
	bitmap { filename = "5626.bmp"; description = "Pos"; };
	bitmap { filename = "7502.bmp"; description = "Pos"; };
	bitmap { filename = "2352.bmp"; description = "Pos"; };
	bitmap { filename = "1811.bmp"; description = "Pos"; };
	bitmap { filename = "5629.bmp"; description = "Pos"; };
	bitmap { filename = "4689.bmp"; description = "Pos"; };
	bitmap { filename = "8496.bmp"; description = "Pos"; };
	bitmap { filename = "2341.bmp"; description = "Pos"; };
} pos_pics_set;

#Now we create a 1D arrays of the 3 digit Numbers stimuli w/ and w/o Interference
#This is b/c we want the 3-digit #s to be randomly matched to each picture.
array {
	text { caption = "212"; font_size = 36; description = "INT"; };
	text { caption = "332"; font_size = 36; description = "INT"; };
	text { caption = "311"; font_size = 36; description = "INT"; };
	text { caption = "112"; font_size = 36; description = "INT"; };
	text { caption = "232"; font_size = 36; description = "INT"; };
	text { caption = "313"; font_size = 36; description = "INT"; };
	text { caption = "211"; font_size = 36; description = "INT"; };
	text { caption = "322"; font_size = 36; description = "INT"; };
	text { caption = "221"; font_size = 36; description = "INT"; };
	text { caption = "131"; font_size = 36; description = "INT"; };
	text { caption = "331"; font_size = 36; description = "INT"; };
	text { caption = "233"; font_size = 36; description = "INT"; };
} int_num_set;

array {
	text { caption = "020"; font_size = 36; description = "NON"; };
	text { caption = "003"; font_size = 36; description = "NON"; };
	text { caption = "100"; font_size = 36; description = "NON"; };
} non_num_set;

#Intro 1
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text {
				caption = "Practice MSIT IAPS"; 
				font_size = 18;
			};
			x = 0; y = 120;
			text { 
				caption = "You will see 3-digit numbers in the middle of different pictures.\n\nSome of these pictures may be upsetting to you.\n\nIf they are too upsetting, let the experimenter know to end the task.\n\nPress the spacebar to proceed."; 
				font_size = 14; 
			};
			x = 0; y = -10;
		}; 
} intro_1;

#Intro 2
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text {
				caption = "Practice MSIT IAPS"; 
				font_size = 18;
			};
			x = 0; y = 120;
			text { 
				caption = "You may place your pointer, middle and ring fingers on the 1, 2 and 3 keys.\n\nYou may use either the numeric keypad on your right OR\n\nYou may use the numeric keys above the QWERTY letters on your left.\n\nPress the spacebar to continue."; 
				font_size = 14; 
			};
			x = 0; y = 0;
		}; 
} intro_2;

#Intro 3
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text {
				caption = "Practice MSIT IAPS"; 
				font_size = 18;
			};
			x = 0; y = 120;
			text { 
				caption = "Your task is to identify the number that is different.\n\nFor example, if you see the number '100', press the '1' key.\n\nIf you see the number '232', press the '3' key.\n\nPress the spacebar to continue."; 
				font_size = 14; 
			};
		x = 0; y = -20;
		}; 
} intro_3;

#Intro 4
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text {
				caption = "Practice MSIT IAPS"; 
				font_size = 18;
			};
			x = 0; y = 120;
			text { 
				caption = "How much time you have to see the number and respond will be random.\n\nSometimes you will have more time and sometimes you will have less time.\n\nJust do the best you can!\n\nWe are now going to practice the task.\n\nPress the spacebar to continue."; 
				font_size = 14; 
			};
		x = 0; y = -20;
		}; 
} intro_4;

#Begin practice
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text {
				caption = "Practice MSIT IAPS"; 
				font_size = 18;
			};
			x = 0; y = 120;
			text { 
				caption = "We will now practice the task.\n\nTry to be as QUICK and ACCURATE as possible.\n\nPress the spacebar when you are ready to start!"; 
				font_size = 14; 
			};
			x = 0; y = 0;
		}; 
} begin_practice;

#Get ready - practice
trial {
	trial_duration = 2992;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text { 
				caption = "Get ready!\n\nThe practice is about to start!"; 
				font_size = 18; 
			};
			x = 0; y = 0;
		}; 
} get_ready_practice;

#IAPS picture only 
trial {
	trial_duration = 392; 
	trial_type = fixed;
	stimulus_event {
		picture {
			bitmap neg;
			x = 0; y = 0;	
		} iaps_pic_only;
	} iaps_pre_event;
} iaps_pre_trial;

#MSIT IAPS task
trial {
	trial_duration = stimuli_length; 
	trial_type = fixed;
	stimulus_event {
		picture {
			bitmap neg;
			x = 0; y = 0;	
		} iaps_pic;
		duration = 1292; #Will replace with 5 different durations
	} msit_iaps_event;
	stimulus_event {
		picture {
		} blank_pic;
		time = 1292; #Will set to vary based on duration of the stimulus prior to it
		duration = 692; 
	} blank_event;	
} msit_iaps_trial;

#Get ready - next level
trial {
	trial_duration = 2992;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text { 
				caption = "Get ready!\n\nThe next level is about to start!"; 
				font_size = 18; 
			};
			x = 0; y = 0;
		}; 
} get_ready_next_level;

#Conclusion
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text { 
				caption = "Great job! You have completed the practice task.\n\nPlease let the experimenter know."; 
				font_size = 14; 
			};
			x = 0; y = 0;
		}; 
} conclusion;
		
begin_pcl;

#SET # trials per level here
int num_trials = 15;
#SET # difficulty levels (# different durations) here
int num_levels = 5;
int num_all_trials = num_trials*num_levels;
#SET proportion/# of Int and NonInt #s here
int num_int = num_trials/2 + 1;
int num_non = num_trials/2 + 1;
int num_all_int = num_all_trials/2 + 1; 
int num_all_non = num_all_trials/2 + 1;

#Create int and nonint number arrays that repeat the sets of int and nonint #s until they match the total # of trials in the task.
array<text> int_num_array[0];
loop int i = 1 until i > num_all_int/int_num_set.count() + 1 #Note: may need to add/subtract 1 if #s don't divide out evenly
begin;
	loop int x = 1 until x > int_num_set.count()
	begin
		if (int_num_array.count() == num_all_int) then
			break;
		end;
	int_num_array.add(int_num_set[x]);
	x = x + 1;
	end;
	i = i + 1;
end;
#Create nonint stim array
array<text> non_num_array[0];
loop int i = 1 until i > num_all_non/non_num_set.count() + 1 #Note: may need to add/subtract 1 if #s don't divide out evenly
begin;
	loop int x = 1 until x > non_num_set.count()
	begin
		if (non_num_array.count() == num_all_non) then
			break;
		end;
	non_num_array.add(non_num_set[x]);
	x = x + 1;
	end;
	i = i + 1;
end;

#Have order of these stimuli seen randomized
int_num_array.shuffle();
non_num_array.shuffle();

#We now combine the 2 arrays into 1 
array<text>combined_num_array[0];
loop int i = 1 until i > non_num_array.count()  
begin
	combined_num_array.add(int_num_array[i]);
	combined_num_array.add(non_num_array[i]);
	i = i + 1;
end;

#Set array of varying Stim durations  
array<int> picdur_set[5] = {392,271,149,89,28}; #Set to 400(original)/1300(original) x durations
array<int> stimdur_set[5] = {1292,892,492,292,92};

neg_pics_set.shuffle();
neu_pics_set.shuffle();
pos_pics_set.shuffle();
#Make the randomized pictures array 
array<bitmap> pics_array[0];
loop int j = 1 until j > 2
begin
	loop int i = 1 until i > neg_pics_set.count()
	begin
		pics_array.add(neg_pics_set[i]);
		pics_array.add(neu_pics_set[i]);
		pics_array.add(pos_pics_set[i]);
		i = i + 1;
	end;
	j = j + 1;
end;

#Make the randomized stim durations arrays
array<int> picdur_array[0];
loop int i = 1 until i > num_all_trials/picdur_set.count()
begin
	loop int j = 1 until j > picdur_set.count()
	begin
		if (picdur_array.count() == num_all_trials) then
			break;
		end;
		picdur_array.add(picdur_set[j]);
		j = j + 1;
	end;
	i = i + 1;
end;

array<int> stimdur_array[0];
loop int i = 1 until i > num_all_trials
begin
	loop int j = 1 until j > stimdur_set.count()
	begin
		if (stimdur_array.count() == num_all_trials) then
			break;
		end;
		stimdur_array.add(stimdur_set[j]);
		j = j + 1;
	end;
	i = i + 1;
end;

#We now create a randomizer array(1 up to # of total stimuli) to randomize the stimuli while keeping everything counterbalanced and in the correct corresponding order across the separate arrays
array<int> randomizer_array[0]; 
loop int i = 1 until i > num_all_trials
begin
	randomizer_array.add(i);
	i = i + 1;
end; 
randomizer_array.shuffle();

#Begin the experiment
intro_1.present();
intro_2.present();
intro_3.present();
intro_4.present();
begin_practice.present();
get_ready_practice.present();

array<int> targ_buttons[0]; #make array to hold target buttons for analysis file
#Show MSIT trials 
loop int x = 1 until x > num_all_trials
begin
		text num = combined_num_array[randomizer_array[x]];
		iaps_pic.set_part(1, pics_array[randomizer_array[x]]);
		iaps_pic_only.set_part(1, pics_array[randomizer_array[x]]);
		iaps_pic.add_part(num,0,0);
		#Set the correct response depending on the stimulus displayed
		string c = num.caption();
		if (c == "212" || c == "313" || c == "221" || c == "100" || c == "331") then
			msit_iaps_event.set_target_button({2,5});
		elseif (c == "332" || c == "112" || c == "211" || c == "233" || c == "020") then
			msit_iaps_event.set_target_button({3,6});
		elseif (c == "311" || c == "232" || c == "322" || c == "131" || c == "003" ) then
			msit_iaps_event.set_target_button({4,7});
		end;
		iaps_pre_trial.set_duration(picdur_array[randomizer_array[x]]);
		msit_iaps_event.set_duration(stimdur_array[randomizer_array[x]]);
		blank_event.set_time(stimdur_array[randomizer_array[x]]);
		msit_iaps_event.get_target_buttons(targ_buttons);
		msit_iaps_event.set_event_code(logfile.subject() + "," + num.caption() + "," + pics_array[randomizer_array[x]].filename().substring(71,8) + "," + num.description() + "," + pics_array[randomizer_array[x]].description()+ "," + string(targ_buttons[1]) + ";" + string(targ_buttons[2]) + "," + string(picdur_array[randomizer_array[x]]) + "," + string(stimdur_array[randomizer_array[x]]));
		iaps_pre_trial.present();
		msit_iaps_trial.present();
		x = x + 1;
end;
conclusion.present();
