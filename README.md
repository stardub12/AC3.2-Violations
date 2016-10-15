# AC3.2-Violations

```
,---.  ,---.-./`)    ,-----.     .---.       ____  ,---------..-./`)    ,-----.   ,---.   .--.  .-'''-.  
|   /  |   \ .-.') .'  .-,  '.   | ,_|     .'  __ `\          \ .-.') .'  .-,  '. |    \  |  | / _     \ 
|  |   |  ./ `-' \/ ,-.|  \ _ \,-./  )    /   '  \  `--.  ,---/ `-' \/ ,-.|  \ _ \|  ,  \ |  |(`' )/`--' 
|  | _ |  | `-'`";  \  '_ /  | \  '_ '`)  |___|  /  |  |   \   `-'`";  \  '_ /  | |  |\_ \|  (_ o _).    
|  _( )_  | .---.|  _`,/ \ _/  |> (_)  )     _.-`   |  :_ _:   .---.|  _`,/ \ _/  |  _( )_\  |(_,_). '.  
\ (_ o._) / |   |: (  '\_/ \   (  .  .-'  .'   _    |  (_I_)   |   |: (  '\_/ \   | (_ o _)  .---.  \  : 
 \ (_,_) /  |   | \ `"/  \  ) / `-'`-'|___|  _( )_  | (_(=)_)  |   | \ `"/  \  ) /|  (_,_)\  \    `-'  | 
  \     /   |   |  '. \_/``".'   |        \ (_ o _) /  (_I_)   |   |  '. \_/``".' |  |    |  |\       /  
   `---`    '---'    '-----'     `--------`'.(_,_).'   '---'   '---'    '-----'   '--'    '--' `-...-'   
                                                                                                         
                                                                                                                 
```
## Objectives

* To reinforce Table Views by exercising
	* The three key data source delegate methods
	* Storyboard segues
	* Passing data to a view controller in ```prepare(for:)```

## Assignment

Let's look at some gut-churning data about restaurants in our neighborhood!

### Steps

1. **NEW STEP! Let's get rid of those unsightly ```.DS_Store``` files, why don't we?** 
	Run the following two commands in Terminal from ANY directory. The reason the directory
	doesn't matter is because we're configuring git _globally_. That tilde is a shortcut to
	your home directory and so that's why you can be in any directory when you type this.

	```
	git config --global core.excludesfile ~/.gitignore
	echo .DS_Store >> ~/.gitignore
	```

1. Fork this repo.
2. Go to your own fork. To verify this, check that your github username is in the URL and C4Q's isn't. 
Note Safari doesn't reveal the full URL until you click on it. (For this and other reasons I use Chrome).
3. Clone your own fork of the repo. This is done by clicking the green ```Clone or download``` button,
copying the URL, going to your project directory and typing:
	
	```
	git clone <url_you_just_copied>
	```
4. Work on your project.
5. When done, commit and push to your repo.

### Instructions

This time, after you clone the project and open it you should have practically nothing. This is just the
output of the Single View application wizard. The only difference between this this project and the Game
of Thrones project is the data file. That file is included: ```violations.json```. 

As part of the process of using the GoT project as a model you'll want to do the following:

1. Make a custom class file to hold your violation data. You'll probably want to name the class
Violations and name the file accordingly. Refer to GOTEpisode.swift for ideas. You can treat all
fields as ```String```.

2. Read the data in from the JSON file included in the project. This step is not the focus
	of the exercise so just set it up and don't think about it yet.
	
	Add this method to your UITableViewController subclass:
	```swift
    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }

        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let ep = Violation(withDict: violationDict) {
                    self.episodes.append(ep)
                }
            }
        }
    }
	```

3. Repeat the act of not repeating step 1.

4. Be creative. Read the ```JSON``` file and decide which fields you want to go where, in the table cell and the detail.