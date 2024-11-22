#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "Welcome to My Salon, how can I help you?\n"

SER_MENU() {
  if [[ $1 ]]; then echo -e "\n$1"; fi
  ser=$($PSQL "select service_id,name from services;")
  echo "$ser" | while IFS='|' read serID name
  do
    echo "$serID) $name"
  done
  SEL_SER
}

SEL_SER() {
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED;")
  if [[ -z $SERVICE_NAME ]]
  then
    SER_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    customerId=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
    if [[ -z $customerId ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      addCustomerRes=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
      if [[ $addCustomerRes != 'INSERT 0 1' ]]; then echo "add customer err"; fi
      customerId=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
      if [[ -z $customerId ]]; then echo err "get customerID err"; fi
      addAppointRes=$($PSQL "insert into appointments(customer_id,service_id,time) values($customerId,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
      if [[ $addAppointRes != 'INSERT 0 1' ]]; then echo "add appointment err"; fi
    else
      CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")
      if [[ -z $CUSTOMER_NAME ]]; then echo "get customer name err"; fi
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      addAppointRes=$($PSQL "insert into appointments(customer_id,service_id,time) values($customerId,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
      if [[ $addAppointRes != 'INSERT 0 1' ]]; then echo "add appointment err"; fi
    fi
  fi
}

SER_MENU

