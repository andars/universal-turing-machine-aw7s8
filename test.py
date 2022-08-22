# configuration = (state, position)

transitions = {
    ('A', '0'): ( '*', 'L',  'B'),
    ('A', '1'): ( '*', 'L',  'C'),
    ('A', '*'): (None, 'R', None),
    ('A', 'o'): ( '0', 'L',  'E'),
    ('A', 'i'): ( '1', 'R', None),

    ('B', '0'): ( 'o', 'L', None),
    ('B', '1'): ( 'i', 'L', None),
    ('B', '*'): ( 'o', 'L',  'D'),
    ('B', 'o'): ( '0', 'R',  'G'),
    ('B', 'i'): ( '1', 'R',  'H'),

    ('C', '0'): ( 'o', 'L', None),
    ('C', '1'): ( 'i', 'L', None),
    ('C', '*'): ( 'o', 'L',  'B'),
    ('C', 'o'): (None, 'R',  'G'),
    ('C', 'i'): (None, 'R',  'H'),

    ('D', '0'): (None, 'R',  'C'),
    ('D', '1'): ( 'i', 'R',  'E'),
    ('D', '*'): (None, 'R',  'A'),
    ('D', 'o'): ( '*', 'L', None),
    ('D', 'i'): (None, 'L', None),
    
    ('E', '0'): (None, 'R',  'D'),
    ('E', '1'): ( 'i', 'L',  'F'),
    ('E', '*'): ( 'o', 'R', None),
    ('E', 'o'): ( '*', 'L',  'D'),
    ('E', 'i'): (None, 'R', None),

    ('F', '0'): ( 'o', 'L', None),
    ('F', '1'): ( 'i', 'L', None),
    ('F', '*'): ( '0', 'R',  'G'),
    ('F', 'o'): ( '0', 'R',  'B'),
    ('F', 'i'): ( '1', 'R',  'B'),

    ('G', '0'): (None, 'R',  'A'),
    ('G', '1'): (None, 'R',  'A'),
    ('G', '*'): ( '0', 'L',  'F'),
    ('G', 'o'): ( '0', 'R', None),
    ('G', 'i'): ( '1', 'R', None),

    ('H', '0'): (None, 'L',  'A'),
    ('H', '1'): (None, 'L',  'A'),
    ('H', '*'): ( '1', 'L',  'F'),
    ('H', 'o'): ( '0', 'R', None),
    ('H', 'i'): ( '1', 'R', None),
}
    
def check_transitions():
    for k,v in transitions.items():
        assert len(k[0]) == 1
        assert len(k[1]) == 1
        if v[0]: assert len(v[0]) == 1
        assert len(v[1]) == 1
        assert v[1] == 'L' or v[1] == 'R'
        if v[2]: assert len(v[2]) == 1

def print_transitions():
    print("   |    0    |    1    |    *    |    0'   |    1'   ")
    states = [chr(ord('A') + i) for i in range(8)]
    syms = ['0', '1', '*', 'o', 'i']
    for state in states:
        print(state, ' |', end='')
        for sym in syms:
            k = (state, sym)
            v = transitions[k]
            next_sym   = ' ' if v[0] == None else v[0]
            next_state = ' ' if v[2] == None else v[2]
            print('  {} {} {}   '.format(next_sym, v[1], next_state), end='')

        print()

    #for state in , v in transitions.items():
    #    pass


tape = '**111*111*011101110010101010101000101010110000101001'
INIT_LEN = len(tape)

tape += '0'*5
tape = list(tape)

def next(state, sym):
    return transitions[(state, sym)]

def print_machine(i, state, pos):
    print(i)
    print(''.join(tape))
    print(' '*(pos-1), '^')
    print(' '*(pos-1), state)

def main():
    check_transitions()
    print_transitions()

    state = 'A'
    pos = INIT_LEN - 1
    print_machine('init', state, pos)

    for i in range(200):
        sym, move, next_state = next(state, tape[pos])
        if sym:
            print(sym)
            tape[pos] = sym
        if move == 'L':
            pos -= 1
        else:
            pos += 1

        if next_state:
            state = next_state
        print_machine(i, state, pos)
        
main()
