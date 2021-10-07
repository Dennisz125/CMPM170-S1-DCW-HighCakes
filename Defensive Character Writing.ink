//test commit --michelle
//Player Knowledge States
LIST RaccoonKnowledge= NotAware, OutsideInfluence, Dunnit
~RaccoonKnowledge = RaccoonKnowledge.NotAware
LIST BPlot= None, Seance, Exorcist, Conclusion
~BPlot = BPlot.None
//red herring for accusing appliances?
-> Kitchen
===Kitchen===
    You are in the kitchen. Where do you want to go?
    *Blender 
    *Notebook ->NoteBook
->END


===NoteBook===
    Here are all the clues you got so far

-> Kitchen