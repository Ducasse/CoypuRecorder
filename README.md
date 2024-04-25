# CoypuRecorder

## Install the package:

#### Use this in a playground:

```smalltalk
Metacello new
	repository: 'github://RedwaneEngels/CoypuRecorder:main/src';
	baseline: 'CoypuRecorder';
	load
```

## Exemples of uses:

#### Exemple of a Performance with a displayer writting the script back in the transcript:

```smalltalk

|p k|
p := PerformanceRecorder uniqueInstance .
p performer: PerformerSuperDirt new. 

p freq: 138 bpm. 

16 downbeats to: #bd.
16 upbeats to: #hh; dirtNotes: '4'.

p playFor: 512 bars.

'080808080809' hexBeat to: #cp.	

'lt ~ ~ mt ~ ~ ht ~ lt ~ mt ~ ~ ~' asDirtSounds to: #toms.

#(3 16) euclidean to: #blip.

p solo: #blip.

16 semiquavers to: #can.

p unsolo: #blip.

p mute: #toms.

'0 1 2 3 12' asDirtNotes to: #bass3.

p stop.

k := PerformanceTextualDisplayer new visitAPerformanceRecorder: p.
k displayInTranscript.

```
#### Exemple of another Performance with a displayer writting the script back in a txt file:

```smalltalk

|p k|
p := PerformanceRecorder uniqueInstance .
p performer: PerformerSuperDirt new. 

p freq: 128 bpm.

16 downbeats to: #cp.

p playFor: 4  bars.

' 0 3 7 10 12 -10 ' asDirtNotes to: #superchip.

p playFor: 8  bars.

' 0 ~ ~ 3 -12 4 ~ ~ 7 ~ 11'  asDirtNotes to: #superchip.
p playFor: 8  bars.

'-12*6 , ~ , 5 * 2 , ~ , 2 *5 , ~*2' asDirtNotes to: #superchip.
p playFor: 8  bars.

p mute: #superchip .

' 4 / 16 ,  6 / 16 , 7 /16 , 9 /16' asDirtNotes  to: #supersaw.
p playFor: 16 bars.

4 semibreves dirtNotes: '4 6 7 9'; to: #supersaw .
p playFor: 16 bars.

p mute: #supersaw.

#(7 16) euclidean dirtNotes: '-10 9 5 -2'; to: #superhex.
p playFor: 16 bars.

k := PerformanceTextualDisplayer new visitAPerformanceRecorder: p.
k writeScriptInTxtFile.

```
