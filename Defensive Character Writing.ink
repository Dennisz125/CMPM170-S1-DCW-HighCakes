INCLUDE Blender
INCLUDE Microwave
INCLUDE Butler
INCLUDE Host
INCLUDE Fridge
INCLUDE Exterminator





//test commit --michelle
//Player Knowledge States
LIST RaccoonKnowledge= NotAware, OutsideInfluence, Dunnit
~RaccoonKnowledge = RaccoonKnowledge.NotAware
LIST BPlot= None, Seance, Exorcist, Conclusion
~BPlot = BPlot.None
LIST GhostKnowledge = NONE, Ghost, Demon
LIST Time = Six, Seven, Eight, Nine
//red herring for accusing appliances?
-> Kitchen
===Kitchen===
    You are in the kitchen. Where do you want to go?
    *Blender ->Blender
    *Notebook ->NoteBook
    +Dining room ->DiningRoom
    
    
-> DiningRoom
===DiningRoom===
    You are in the dining room
    +Kitchen -> Kitchen

->END


===NoteBook===
    Here are all the clues you got so far

-> Kitchen


