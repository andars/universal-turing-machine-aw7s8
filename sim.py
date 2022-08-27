import convert

def check_transitions(transitions):
    for k,v in transitions.items():
        assert len(k[0]) == 1
        assert len(k[1]) == 1
        if v[0]: assert len(v[0]) == 1
        assert len(v[1]) == 1
        assert v[1] == 'L' or v[1] == 'R'
        if v[2]: assert len(v[2]) == 1

def print_transitions(states, transitions):
    print("   |    0    |    1    ")
    syms = ['0', '1']
    for state in states:
        print(state, ' |', end='')
        for sym in syms:
            k = (state, sym)
            v = transitions[k]
            next_sym   = ' ' if v[0] == None else v[0]
            next_state = ' ' if v[2] == None else v[2]
            print('  {} {} {}   '.format(next_sym, v[1], next_state), end='')

        print()

tape = '0'*20
tape = list(tape)

def next(state, sym, transitions):
    return transitions[(state, sym)]

def print_machine(i, state, pos):
    LINE_LEN = 100
    num_lines = (len(tape) + LINE_LEN - 1)//LINE_LEN
    pos_str = ' '*pos + '^'
    state_str = ' '*pos + state
    print(i)
    print("state: {}, pos: {}".format(state, pos))
    for l in range(num_lines):
        start = l * LINE_LEN
        end = start + LINE_LEN
        print(''.join(tape[start:end]))
        print(pos_str[start:end])
        print(state_str[start:end])
    print('='*LINE_LEN)

def run(states, transitions):
    check_transitions(transitions)
    print_transitions(states, transitions)

    state = 'X'
    pos = 5
    print("tape: ", len(tape))
    print_machine('init', state, pos)

    for i in range(100):
        sym, move, next_state = next(state, tape[pos], transitions)
        if sym:
            tape[pos] = sym
        if move == 'L':
            pos -= 1
        else:
            pos += 1

        if pos < 0:
            print("halt")
            break

        if next_state:
            if next_state == 'h':
                print('halt')
                return
            print('{}: {} => {}'.format(sym, state, next_state))
            state = next_state
            print_machine(i, state, pos)

def main():
    run(convert.bb3_states, convert.bb3_transitions)
main()
