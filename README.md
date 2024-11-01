# Codeunit Inheritance

This app shows a "faux" way of inheriting codeunits. It has a base "class" codeunit of "Person" which can be inherited by two derived "class" codeunits of Couch Potato and Athlete.
In the derived classes you can both get _and set_ the base class properties, since the codeunit instance is apparently persistent.

The app also shows two ways in which you can inherit over multiple levels. One (Professional Athlete) is using the Base() class multiple times, and the other (Professional Potato) is to provide multiple "Base" classes: one for each inherited codeunit.
This is most visible in the Print Data codeunit.

Try it out!
