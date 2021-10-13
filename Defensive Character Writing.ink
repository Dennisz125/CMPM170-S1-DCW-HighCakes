INCLUDE Blender
INCLUDE Microwave
INCLUDE Butler
INCLUDE Host
INCLUDE Fridge
INCLUDE Exterminator
INCLUDE DEBUG

-> Init 

=== Init === 
    // -- Player Knowledge States -- 
    LIST RaccoonKnowledgeList= NotAware, OutsideInfluence, Dunnit
    VAR RaccoonKnowledge = RaccoonKnowledgeList.NotAware

    LIST BPlotList= None, Seance, Exorcist, Conclusion
    VAR BPlot = BPlotList.None
    
    LIST CakeList = None, Some, Blood, Trail, RaccoonIn
    VAR Cake = CakeList.None
    
    VAR Time = 1700 //Military time
    //Todo: Function to convert time
    Time: {Time}
    //red herring for accusing appliances?
    
    
    // -- Butler Variables --  
    // whether butler has been talked to 
    VAR butler_met = false
    // whether player has asked butler who he is 
    VAR butler_who = false 
    // whether butler has been asked about host 
    VAR butler_host = false 
    // times player selects hello option 
    VAR butler_hello = 0
    
    // -- Exterminator Variables --  
    // whether Exterminator has been talked to 
    VAR exterminator_met = false
    // whether player has asked Exterminator who he is 
    VAR exterminator_who = false 
    // whether Exterminator has been asked about host 
    VAR exterminator_host = false 
    // times player selects hello option 
    VAR exterminator_hello = 0
    
    
    // -- Cake State: 0 is gone, 4 is full --
    VAR CakeState = 4
    
    VAR KitchenVisits = 0
    VAR FoyerVisits = 0
    VAR DiningVisits = 0
    
    // TODO divert to beginning of story 
    ->Intro

===Intro===
Exterminator: {GetExterminatorQuotes()}
->Kitchen

===Kitchen===
    You are in the kitchen
    + [Talk to Blender]
        ->Blender
    + [Talk to Microwave]
        ->Microwave
    + [Talk to Fridge]
        ->Fridge
    + [Dining room] 
        ->DiningRoom
    + [Foyer] 
        -> Foyer 
    + [Open Notebook] 
        -> NoteBook(Kitchen)
    + [DEBUG]
        ->DEBUG

    
    
===DiningRoom===
    You are in the dining room
    + [Talk to Host]
        ->Host
    + [Talk to Exterminator]
        ->Exterminator
    + [Inspect cake]
        ->Cake
    + [Kitchen]
        ->Kitchen
    + [Open Notebook] 
        -> NoteBook(DiningRoom)
->END

=== Foyer ===
    // TODO add cool text with a short description of the foyer  
    Boy this sure is a foyer. 
    + [Talk to Butler]
        -> Butler
    + [Go to Kitchen] 
        -> Kitchen 
    + [Open Notebook] 
        -> NoteBook(Foyer)


===NoteBook(room)===
    Here are all the clues you got so far.
    ->ViewRaccoonKnowledge->
    ->ViewCake->
    // Print out knowledge state
    + [Close Notebook]
        {
        - room == Kitchen:
            ->Kitchen
        - room == DiningRoom:
            ->DiningRoom
        - room == Foyer:
            ->Foyer
        }
    
===ViewCake===
    {
        - CakeState == 4:
            Cake is Full
        - CakeState == 3:
            Cake lost some toppings
        - CakeState == 2:
            Cake lost some pieces
        - CakeState == 1:
            Cake is gone
        }
->->

===ViewRaccoonKnowledge===
    {
        - RaccoonKnowledge == RaccoonKnowledgeList.NotAware:
            Raccoon is not aware
        - RaccoonKnowledge == RaccoonKnowledgeList.OutsideInfluence:
            Raccoon is aware of Outside Influence
        - RaccoonKnowledge == RaccoonKnowledgeList.Dunnit:
            Raccoon is Dunnit
    }
->->
