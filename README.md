# AmberNet

This project uses [AtomTerm](https://github.com/ambertide)
to serve a minimalist landing page over telnet for... 
reasons.

You can connect it using `telnet atomterm.amberti.de 23`

For your own sanity, avoid asking why I used php.

## Deployment

While we are here, let's discuss how I deploy this... 
"thing", because had I not chosen PHP I could just throw it
in Heroku and forget about it, but bad decisions were given,
I wanted to practise the language, ya da da.

So, obviously:

* In every push a GitHub action is executed which SSHs into
a Google Cloud VM instance, ~since I am a cheapstake~ to 
keep operating costs down, that instance is a spot instance,
which means it sits behind a MIG.
* That action, after SSHing, clones/pulls this repository
into the affromentioned VM.
* It than registers the atomterm service to Systemd if it 
has not done so, or otherwise re-starts it.
* Funnily enough, that restart may very well fail, because
Linux has a fun habit of not releasing sockets soon enough
in which case Systemd will wait for 30 seconds before
attempting again.
* If all wents well, this should work.