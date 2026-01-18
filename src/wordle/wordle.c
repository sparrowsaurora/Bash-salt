/*******************************************************************
 * 
 * File Name: wordle.c
 *
 * Description: 
 *   Wordle game implementation in C. This file contains the core logic
 * 
 * Author: sparrowsaurora
 * Date: 15/01/2026
 * 
 * Assumptions:
 *   [List any specific assumptions made, e.g., input format, environment.]
 *
 *******************************************************************/

// Include necessary headers

#include <stdio.h>


// define colours

#define GREEN "\033[0;32m"
#define RED "\033[0;31m"
#define GREEN "\033[0;32m"
#define CYAN "\033[0;36m"
#define LIGHT_GRAY "\033[0;37m"
#define YELLOW "\033[1;33m"
#define BOLD "\033[1m"
#define FAINT "\033[2m"
#define UNDERLINE "\033[4m"
#define END "\033[0m"

// datatypes
typedef union guess_attempt {
    char word[6];
    int attempt_number;
} guess_attempt;

// Function prototypes
void print_instructions();
void colour_refernce_instructions();
guess_attempt get_user_guess(int attempt_number);
// convert_guess_to_numbers(char* target_word, char* user_guess);

void print_instructions() {
    printf("%sWelcome to the Word Guessing Game!%s\n", CYAN, END);
    printf("Guess the 5-letter word within 6 attempts.\n");
    printf("After each guess, you'll see feedback in colors:\n");
    colour_refernce_instructions();
    printf("if you need help, type 'help'\n");
    printf("Good luck and have fun!\n");
}

void colour_refernce_instructions() {
    printf("%sGreen = Correct%s\n", GREEN, END);
    printf("%sYellow = Wrong Position%s\n", YELLOW, END);
    printf("%sRed = Not in word%s\n", RED, END);
}

int main() {
    print_instructions();
    return 0 ;
}
    

