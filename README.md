# GhostAPI

## Installation

create cartfile:
```
touch Cartfile
```

edit Cartfile:

```
github "Bijiabo/GhostAPI"
```

run in shell:

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
