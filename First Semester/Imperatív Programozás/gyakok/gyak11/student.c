#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Student
{
	int id;
	int age;
	double avg;
	Type type;
};

typedef struct Student Student;

enum Level {
	BSc, MSc, PhD
};

typedef union ExtraData {
	int course_count;
	double credit_index;
	struct
	{
		int erdos;
		double impact;
	} phd_extra;
} ExtraData;

int bestStudent(Student students[], int len)
{
	Student best = students[0];

	Type l = PhD;

	for(int i=0; i<len; ++i)
	{
		if(students[i].avg > best.avg)
		{
			best = students[i];
	
		}
	}

	return best.id;
}

void Student *studentInit(Type t) {
	Student *result = malloc(sizeof(Student));
	result->id = rand() % 101;
	result->age = (rand() % 33) + 18;
	result->avg = (double)rand()/ (double)(RAND_MAX) * 4 + 1;
	result->type = t;

	switch(t) {
	case Msc:
		result->extra.credit_index = (double)rand()/ (double)(RAND_MAX) * 10;
		break;
	case PhD:
		result->extra.phd_extra.impact = (double)rand()/ (double)(RAND_MAX);
		result->extra.phd_extra.erdos = rand() * 11;
		break;
	case BSc:
	default:
		result->extra.course_count = rand() % 100;
		result->type = BSc;
	}

int main()
{
	srand(time(NULL));
	Student s1;

	ExtraData e;
	e.course_count = 10;

	Student *arr[10];

	for(int i=0; i<10; ++i)
	{
		arr[i] = studentInit(rand() % 3);
	}

	for(int i=0; i<10; ++i)
        {
                free(arr[i]);
        }

	prtintf("%ld\n", e.course_count);

	prtintf("%ld\n", sizeof(s1));

	

	return 0;
}
