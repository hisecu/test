#!/usr/bin/perl
#
# Simple script to calculate the final score percentage of
# the course Learning How to Learn version 003
# based on the information on the following URI:
#   https://class.coursera.org/learning-003/wiki/view?page=Assessments
#
# Note: This code is _not_ elegant at all, I do not want to
# waste much time on this, so it is just a quick hack.
# It is not robust, and there is no guarantee it is correct in any way. 
# Feel free to improve it and propose a git push.
#
# C. Fenijn, February 2015.
#

my $total=0;                      # init

print("Type of student [r]egular or [d]istincion: ");
my $type=<STDIN>;
$type=~s/\s+$//g;

print("Intro quiz (max 5): ");
my $intro_quiz=<STDIN>;
$intro_quiz=~s/\s+$//g;

print("Weekly quiz 1 (max 13): ");
my $weekly1=<STDIN>;
$weekly1=~s/\s+$//g;

print("Weekly quiz 2 (max 12): ");
my $weekly2=<STDIN>;
$weekly2=~s/\s+$//g;

print("Weekly quiz 3: (max 14): ");
my $weekly3=<STDIN>;
$weekly3=~s/\s+$//g;

print("Final exam (max 27): ");
my $final=<STDIN>;
$final=~s/\s+$//g;

if($type=~/d/i)
{
  print("Assignment 1 (max 10): ");
  my $assignment1=<STDIN>;
  $assignment1=~s/\s+$//g;

  print("Assignment 2 (max 15): ");
  my $assignment2=<STDIN>;
  $assignment2=~s/\s+$//g;

  $weekly1=($weekly1/13) * 15;
  $weekly2=($weekly2/12) * 15;
  $weekly3=($weekly3/14) * 15;
  $weekly_subtotal=$weekly1+$weekly2+$weekly3;
  print("Weekly subtotal: $weekly_subtotal\n");

  $final=($final/27) * 30;

  $assignment1=($assignment1/10) * 10;
  $assignment2=($assignment2/15) * 10;
  $assignment_subtotal=$assignment1+$assignment2;
  print("Assignment subtotal: $assignment_subtotal\n");

  print("Adding up Intro Quiz $intro_quiz, Weekly Subtotal $weekly_subtotal,\nAssignment Subtotal $assignment_subtotal and Final $final...\n");

  $total=$intro_quiz + 
         $weekly_subtotal +
         $assignment_subtotal +
         $final;
}
else
{

  $weekly1=($weekly1/13) * 20;
  $weekly2=($weekly2/12) * 20;
  $weekly3=($weekly3/14) * 20;
  $weekly_subtotal=$weekly1+$weekly2+$weekly3;
  print("Weekly subtotal: $weekly_subtotal\n");

  $final=($final/27) * 35;

  print("Adding up Intro Quiz $intro_quiz, Weekly Subtotal $weekly_subtotal,\nand Final $final...\n\n");

  $total=$intro_quiz + 
         $weekly_subtotal +
         $final;
}

print("Total score percentage: $total\n");


