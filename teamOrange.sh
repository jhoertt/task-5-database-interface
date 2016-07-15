#!/bin/bash

echo "What is your last name?"
read name
echo "How old are you?"
read age
echo "How many pets do you have?"
read pets
echo "How many siblings do you have?"
read siblings
echo "How many planets are in the solar system?"
read planets
echo "Do you like ice cream? (yes/no)"
read icecream

echo $age > TeamOrangeAnswer.list 
echo $pets >> TeamOrangeAnswer.list
echo $siblings >> TeamOrangeAnswer.list
echo $planets >> TeamOrangeAnswer.list
echo $icecream >> TeamOrangeAnswer.list
date >> TeamOrangeAnswer.list
paste -d, -s TeamOrangeAnswer.list > TeamOrangeAnswer$name.csv

rm TeamOrangeAnswer.list
