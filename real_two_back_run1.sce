#NOTE: display size is 640 x 480 on old exptl laptop, so this expt is set to 640 x 480 to match.

#Header
response_matching = simple_matching;
default_font_size = 36; #Stim font size = 36 in old expt
active_buttons = 3;
button_codes = 1,2,3;
stimulus_properties = letter, string, is_target, string;
event_code_delimiter = ",";
#End Header

#Begin SDL
begin;

#List of letters used in expt
array {
   text { caption = "H"; description = "H"; } H;
   text { caption = "D"; description = "D"; } ;
   text { caption = "C"; description = "C"; } ;
   text { caption = "G"; description = "G"; } ;
   text { caption = "M"; description = "M"; } ;
   text { caption = "W"; description = "W"; } ;
   text { caption = "T"; description = "T"; } ;
   text { caption = "N"; description = "N"; } ;
   text { caption = "R"; description = "R"; } ;
   text { caption = "V"; description = "V"; } ;
   text { caption = "P"; description = "P"; } ;
   text { caption = "K"; description = "K"; } ;
   text { caption = "J"; description = "J"; } ;
   text { caption = "L"; description = "L"; } ;
   text { caption = "Q"; description = "Q"; } ;
   text { caption = "Z"; description = "Z"; } ;
   text { caption = "S"; description = "S"; } ;
   text { caption = "B"; description = "B"; } ;
} letters_set;

#Begin Real 2-back round 1
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
		picture {
		text { 
			caption = "'2-back: Round 1'\n\nFor the 2-back task, press '1' if the letter you see is the same as TWO letters before it.\n\nWe will now begin round 1 of the real 2-back task.\n\nRemember to be as QUICK and ACCURATE as you can.\n\nPress the spacebar when you are ready to start!"; 
			font_size = 14; 
		};
		x = 0; y = 0;
		}; 
} begin_real;

#Get ready - real task
trial {
	trial_duration = 2992; #Set to 2992 instead of 3000 to take into account refresh rate
	trial_type = specific_response;
	terminator_button = 3;
		picture {
		text { 
			caption = "Get ready!\n\nThe task is about to start!"; 
			font_size = 14; 
		};
		x = 0; y = 0;
		}; 
} get_ready_real;

#2 back task
trial {
   trial_duration = 2492;
   all_responses = false;
   stimulus_event {
      picture {
         text H;
         x = 0; y = 0;
      } pic;
      time = 0;
      duration = 492;
   } event1;
} two_back_trial;

#Conclusion
trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 3;
		picture {
		text { 
			caption = "Great job! You have completed the first round of the real 2-back task.\n\nPlease let the experimenter know."; 
			font_size = 14; 
		};
		x = 0; y = 0;
		}; 
} conclusion;

begin_pcl;

#Subscript that randomly selects a letter EXCEPT for the previous letter displayed (because this letter is NOT a target)
sub
   int random_exclude( int first, int last, int exclude )
begin
   int rval = random( first, last - 1 );
   if (rval >= exclude) then
      rval = rval + 1
   end;
   return rval
end;

#SET num trials here
int stim_count = 30;

#Have 30% of stimuli be targets
array<int> is_target[stim_count];
loop int i = 1 until i > stim_count / 3 begin
   is_target[i] = 1;
   i = i + 1
end;
is_target.shuffle();
#Keep randomizing array until you have one where the first stimulus displayed cannot be a correct response
loop until is_target[1] == 0 && is_target[2] == 0 begin
   is_target.shuffle()
   end;

#Present Intro Slides
begin_real.present();
get_ready_real.present();

#Present Real 2 back Run 1 Trials
loop
   int i = 1;
   int last = 0;
   int two_back = 0;
until
   i > stim_count
begin
   int index;
   string target_string = ",no";
   if (is_target[i] == 1) then
      index = two_back;
      target_string = ",yes"
   else
      index = random_exclude( 1, letters_set.count(), two_back )
   end;
   pic.set_part( 1, letters_set[index] );
   event1.set_event_code( letters_set[index].description() + target_string );
   two_back_trial.present();
   two_back = last;
   last = index;
   i = i + 1
   end;

conclusion.present();