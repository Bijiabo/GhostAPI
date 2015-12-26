# GhostAPI

## Installation

1. create cartfile:

	```
	touch Cartfile
	```

2. edit Cartfile:

	```
	github "Bijiabo/GhostAPI"
	```

3. run in shell:

	```
	carthage update --platform iOS
	```

## Usage

1. setup

  ```
  GhostAPI.sharedInstance.clientSecret = "your client secret"
  GhostAPI.sharedInstance.hostDomain = "yourdomain.com"
  ```

2. fetch resource (i.e. `/tags`)

  ```
  GhostAPI.sharedInstance.tags { (error, json) -> Void in
      print(error)
      print(json)
    }
  ```
