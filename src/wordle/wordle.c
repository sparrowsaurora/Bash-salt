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
#include <stdbool.h>
#include <string.h>
#include <ctype.h>
#include <stdint.h>
#include <string.h>


// define colours

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
typedef struct {
    char letter;
    int state;
} coloured_letter;

typedef union guess_attempt {
    coloured_letter word[5];
} guess_attempt;

// helper functions

int is_in_array(int val, int* arr, int size) {
    for (int i = 0; i < size; i++) {
        if (arr[i] == val) { // If the current element matches the value
            return 1; // Found the value, return true immediately
        }
    }
    return 0; // Looped through the whole array, value not found
}

// main functions

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

void get_and_validate_guess(uint8_t guess_count) {
    char guess[10];
    printf("---------------\n");
    printf("(%d/6) Enter a Guess: ", guess_count);

    fgets(guess, 10, stdin);

    if (strlen(guess) > 5) {
        guess[5] = '\0'; // Truncate the string to the first 5 characters
    }
    
    for (int i = 0; guess[i] != '\0'; i++) {
        guess[i] = (char)tolower((unsigned char)guess[i]);
    }

    printf("\n---------------\n");

}

void convert_guess_to_numbers(
    const char *target,
    const char *guess,
    int latest_guess[5]
) {
    for (int i = 0; i < 5; i++) {
        if (guess[i] == target[i]) {
            latest_guess[i] = 2;
        } else if (strchr(target, guess[i]) != NULL) {
            latest_guess[i] = 1;
        } else {
            latest_guess[i] = 0;
        }
    }
}

// void print_list_of_past_words_coloured(guess_attempt past_guesses[]) {
//     for (int i; i >= (sizeof(past_guesses) / sizeof(past_guesses[0])); i++ ) {
//         for 
//     }
// }

bool check_for_end_condition(int latest_guess[5], int guess_count, const char *target) {
    bool win = true;
    for (int i = 0; i < 5; i++) {
        if (latest_guess[i] != 2) {
            win = false;
            break;
        }
    }

    if (win) {
        printf("Well Done!\n");
        return true;
    }

    if (guess_count == 6) {
        printf("Nice try, the word was %s\n", target);
        return true;
    }

    return false;
}


int main() {
    print_instructions();
    return 0;
}
    

