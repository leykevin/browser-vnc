#Browser-VNC

No-VNC with Browser Autostart

##How to use:
> docker run -p 6080:6080 leykevin/browser-vnc:latest

##Environments:
| Parameter | Default Value | Exampe            | Hint                                  |
| --------- | ------------- | ----------------- | ------------------------------------- |
| VNC_PASS  | 123456        | abc123            | 6chars                                |
| GEOMETRY  | 1440x900      | 800x600           |                                       |
| PROGRAM   | (none)        | firefox           |firefox,chrome or unset to use lxpanel |
| URL       | (none)        | https://localhost |                                       |

![Example Screenshot](https://github.com/leykevin/browser-vnc/blob/master/noVNC.png?raw=true)