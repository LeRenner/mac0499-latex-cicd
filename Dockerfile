# Container image that runs your code
FROM ubuntu:latest

RUN apt update
RUN yes | apt upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt install -y make biber latexmk texlive-plain-generic texlive-latex-base texlive-luatex lmodern fonts-lmodern texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra texlive-fonts-extra texlive-bibtex-extra texlive-science texlive-lang-english texlive-lang-portuguese openssh-client

# copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

# run makefile to generate pdf
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
