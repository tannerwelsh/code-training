#include <stdio.h>

int main(void)
{
  float change;
  printf("What do you need in change? ");
  scanf("%f", &change);
  printf("You need %.2f in change.\n", change);

  int quarters = change / 0.25;
  change = change - (quarters * 0.25);

  int dimes = change / 0.1;
  change = change - (dimes * 0.1);

  int nickels = change / 0.05;
  change = change - (nickels * 0.05);

  int pennies = change / 0.01;

  printf("Your change:\n");
  printf("%d quarters, %d dimes, %d nickels, and %d pennies.\n",
          quarters, dimes, nickels, pennies);

  int totalCoins = quarters + dimes + nickels + pennies;
  printf("%d\n", totalCoins);

  return 0;
}
