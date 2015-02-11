#!/usr/bin/perl -wT
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

use strict;
use warnings;

my $total=0;                      # init

print("Type of student [r]egular or [d]istincion: ");
my $type=<STDIN>;
$type=~s/\s+$//g;

if($type !~ /^[d|r]$/i)
{
  die("Error: Fatal: you must type r or d, exiting...\n");
}

print("Intro quiz (max 5): ");
my $intro_quiz=<STDIN>;
$intro_quiz=~s/\s+$//g;
exit_if_wrong_value(5,$intro_quiz);

print("Weekly quiz 1 (max 13): ");
my $weekly1=<STDIN>;
$weekly1=~s/\s+$//g;
exit_if_wrong_value(13,$weekly1);

print("Weekly quiz 2 (max 12): ");
my $weekly2=<STDIN>;
$weekly2=~s/\s+$//g;
exit_if_wrong_value(12,$weekly2);

print("Weekly quiz 3: (max 14): ");
my $weekly3=<STDIN>;
$weekly3=~s/\s+$//g;
exit_if_wrong_value(14,$weekly3);

print("Final exam (max 27): ");
my $final=<STDIN>;
$final=~s/\s+$//g;
exit_if_wrong_value(27,$final);

if($type=~/d/i)
{
  print("Assignment 1 (max 10): ");
  my $assignment1=<STDIN>;
  $assignment1=~s/\s+$//g;
  exit_if_wrong_value(10,$assignment1);

  print("Assignment 2 (max 15): ");
  my $assignment2=<STDIN>;
  $assignment2=~s/\s+$//g;
  exit_if_wrong_value(15,$assignment2);

  $weekly1=($weekly1/13) * 15;
  $weekly2=($weekly2/12) * 15;
  $weekly3=($weekly3/14) * 15;
  my $weekly_subtotal=$weekly1+$weekly2+$weekly3;
  print("Weekly subtotal: $weekly_subtotal\n");

  $final=($final/27) * 30;

  $assignment1=($assignment1/10) * 10;
  $assignment2=($assignment2/15) * 10;
  my $assignment_subtotal=$assignment1+$assignment2;
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
  my $weekly_subtotal=$weekly1+$weekly2+$weekly3;
  print("Weekly subtotal: $weekly_subtotal\n");

  $final=($final/27) * 35;

  print("Adding up Intro Quiz $intro_quiz, Weekly Subtotal $weekly_subtotal,\nand Final $final...\n\n");

  $total=$intro_quiz + 
         $weekly_subtotal +
         $final;
}

print("Total score percentage: $total\n");


sub exit_if_wrong_value
{
  my $max_value=$_[0];
  my $check_value=$_[1];
  if($check_value !~ /^\d+$/ &&
     $check_value !~ /^\d+\.\d+$/)
  {
    die("Error: Fatal: Value must be in format N or N.N, so either an integer or a float. Exiting...\n");
  }
  elsif($check_value > $max_value)
  {
    die("Error: Value $check_value is larger than the maximum value $max_value. Exiting...\n");
  }
}
