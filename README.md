# Klaire Curde's Resume

A compiled version of this resume is available [here](kcurde.pdf).
My personal website is found at https://klaire.codes.

## About
This resume uses a heavily modified version of the AltaCV Resume Class. It includes new additions such as:

- A customizable `Makefile`.
- Automatic opinionated code formatting on build via `latexindent`.
- Docker/Podman support for a light and portable build cycle.
- Enhanced classes.
- Updated fontawesome packages.
- Modern tooling and organization.

## Building
### Docker/Podman (recommended)
Simply run the following to build the container with the tag "resume":
```
podman build -t resume .
```
or use the included `build.sh` script.

### Arch Linux
#### Dependencies
##### Bare minimum
- texlive
- make

##### latexindent:
To install  follow the latexindent documentation found [here](https://latexindentpl.readthedocs.io/en/latest/sec-how-to-use.html).

- perl
- cpanminus


## Usage
### Docker/Podman
```
podman run -v ./:/src -i resume:latest
```
or use the included `run.sh` script.

### Arch Linux
The included Makefile can be run as is with
```
make
```
However additional options are available and can be displayed with `make help`.
