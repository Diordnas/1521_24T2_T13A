struct _coord { // total: 16 bytes
    double x;   // 8 bytes
    double y;   // 8 bytes
};

SIZEOF_COORD = 16
COORD_X_OFFSET = 0
COORD_Y_OFFSET = 8


typedef struct _node Node;
struct _node {  // total: 8 bytes
    int value;  // 4 bytes
    Node *next; // 4 bytes
};

SIZEOF_NODE = 8
NODE_VALUE_OFFSET = 0
NODE_NEXT_OFFSET = 4

struct _enrolment { // total 32 bytes
    int stu_id;         // e.g. 5012345      int : 4 bytes
    char course[9]:     // e.g. "COMP1521"   char[9]: 9 bytes
    char term[5];       // e.g. "17s2"       5 bytes
    char grade[3];      // e.g. "HD"         3 bytes
    //                .align 2 will go here: 3 bytes
    double mark;        // e.g. 87.3         8 bytes
};

SIZEOF_ENROLMENT = 32
ENROLMENT_ID_OFFSET = 0
ENROLMENT_COURSE_OFFSET = 4
ENROLMENT_TERM_OFFSET = 13
ENROLMENT_GRADE_OFFSET = 18
ENROLMENT_MARK_OFFSET = 24



struct _queue {
    int nitems;     // # items currently in queue
    int head;       // index of oldest item added
    int tail;       // index of most recent item added
    int maxitems;   // size of array
    Item *items;    // malloc'd array of Items
};