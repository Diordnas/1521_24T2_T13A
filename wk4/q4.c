struct _coord {
    double x;
    double y;
};

STRUCT_COORD_X_OFFSET = 0
STRUCT_COORD_Y_OFFSET = 8
SIZEOF_STRUCT_COORD = 16


typedef struct _node Node;
struct _node {
    int value;
    Node *next;
};

struct _enrolment {
    int stu_id;         // e.g. 5012345      offset : 0
    char course[9]:     // e.g. "COMP1521"   offset : 4
    char term[5];       // e.g. "17s2"       offset : 13
    char grade[3];      // e.g. "HD"         offset : 18
                        // here we might do .align 2 to get back to the word grid
    double mark;        // e.g. 87.3         offset : 24
};

    .data
sample_student:
    .word   5012345
    .asciiz "COMP1521"
    .asciiz "17s2"
    .asciiz "HD"
    .align 2
    .double 87.3

students:
    .space 320


struct _queue {
    int nitems;     // # items currently in queue
    int head;       // index of oldest item added
    int tail;       // index of most recent item added
    int maxitems;   // size of array
    Item *items;    // malloc'd array of Items
};