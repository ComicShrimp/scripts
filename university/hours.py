import csv

POINTS_NEEDED = 61
FINAL_POINTS = 0


def count_events(event_type: str) -> int:
    if event_type == "LOC":
        return 5
    elif event_type == "REG":
        return 10
    elif event_type == "NAC":
        return 20
    elif event_type == "INT":
        return 25
    else:
        raise Exception(f"Event Type not accepted: {event_type}")


def count_courses(time: int) -> int:
    if 0 < time <= 20:
        return 2
    elif 21 <= time <= 50:
        return 4
    elif 51 <= time <= 100:
        return 6
    else:
        return 10


def count_points(line):
    if line["Type"] == "EVE":
        return count_events(line["Event Type"])
    elif line["Type"] == "COU":
        return count_courses(float(line["Time"]))
    else:
        raise Exception(f"Type not suported: {line}")


with open("hours.csv", "r") as file:

    # reading the CSV file
    csv_file = csv.DictReader(file)

    # displaying the contents of the CSV file
    for line in csv_file:
        FINAL_POINTS += count_points(line)

print(f"Final Points: {FINAL_POINTS}")
