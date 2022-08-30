import argparse

bb2_states = ['X', 'Y']
bb2_transitions = {
    ('X', '0'): ('1', 'R', 'Y'),
    ('X', '1'): ('1', 'L', 'Y'),
    ('Y', '0'): ('1', 'L', 'X'),
    ('Y', '1'): ('1', 'R', 'h'),
}

bb3_states = ['X', 'Y', 'Z']
bb3_transitions = {
    ('X', '0'): ('1', 'R', 'Y'),
    ('X', '1'): ('1', 'R', 'h'),
    ('Y', '0'): ('0', 'R', 'Z'),
    ('Y', '1'): ('1', 'R', 'Y'),
    ('Z', '0'): ('1', 'L', 'Z'),
    ('Z', '1'): ('1', 'L', 'X'),
}

bb4_states = ['W', 'X', 'Y', 'Z']
bb4_transitions = {
    ('W', '0'): ('1', 'R', 'X'),
    ('W', '1'): ('1', 'L', 'X'),
    ('X', '0'): ('1', 'L', 'W'),
    ('X', '1'): ('0', 'L', 'Y'),
    ('Y', '0'): ('1', 'R', 'h'),
    ('Y', '1'): ('1', 'L', 'Z'),
    ('Z', '0'): ('1', 'R', 'Z'),
    ('Z', '1'): ('0', 'R', 'W'),
}

def encode_ia_entry(state, symbol, transitions, num_zeros):
    ss = (state, symbol)
    d = '0' if transitions[ss][1] == 'R' else '1'
    n = '0' if transitions[ss][0] == '0' else '1'
    ia_entry = '0' + n + d + '0'
    ia_entry = '10'*num_zeros + ia_entry
    print("{} => {}".format(ss, transitions[ss]))
    print("Ia entry: ", ia_entry);
    return ia_entry

# number of zeros between (qi, sj) in Ib and (qi, sj) in Ia
# 
# b0 = 1
# b1 = 1
# 
# Ib = '0' + '1'*b1 + '0' + '1'*b0 + '0'
# print("Ib entry: ", Ib)

def encode_ib_entry(sym, num_zeros):
    entry = '1' * num_zeros + '0'
    if sym == '1':
        entry = '0' + entry
    return entry

def encode(states, transitions):
    print('encoding Ia')
    num_zeros_ia = 0
    ia_entries = []
    for state in states[::-1]:
        for sym in ['1', '0']:
            next_state = transitions[(state, sym)][2]
            if next_state in states:
                next_state_index = states.index(next_state)
            else:
                assert next_state == 'h'
                next_state_index = len(states)
            num_zeros_ib = 3 * next_state_index + 1
            num_zeros = num_zeros_ib + num_zeros_ia
            print(state, sym, next_state)
            print('zeros: ib: {}, ia: {}'.format(num_zeros_ib, num_zeros_ia))
            ia_entry = encode_ia_entry(state, sym, transitions, num_zeros)

            num_zeros_in_entry = 0
            for c in ia_entry:
                if c == '0': num_zeros_in_entry += 1

            ia_entries += [((state, sym), ia_entry, num_zeros_in_entry)]
            num_zeros_ia += num_zeros_in_entry


    print(ia_entries)

    # 0,0 -> 1
    # 0,1 -> 2
    # 1,0 -> 4
    # 1,1 -> 5
    # 2,0 -> 7
    # 2,1 -> 8
    # 3,0 -> 9
    # (3 * s + 1)

    print('encoding Ib')
    ib_entries = []

    for state in states[::-1]:
        for sym in ['1', '0']:
            print("encoding ", state, sym)
            state_index = states.index(state)
            num_zeros_ib = state_index * 3 + 1
            if sym == '1':
                num_zeros_ib += 1

            num_zeros_ia = 0
            for entry in ia_entries:
                if entry[0] == (state, sym):
                    break
                num_zeros_ia += entry[2]
            num_zeros = num_zeros_ia + num_zeros_ib + 1
            print('zeros: ib: {}, ia: {}, total: {}'.format(num_zeros_ib, num_zeros_ia, num_zeros))

            ib_entry = encode_ib_entry(sym, num_zeros)
            print(ib_entry)
            ib_entries += [((state, sym), ib_entry)]

    ib_region = '0' + ''.join(e[1] for e in ib_entries) + '0'
    ia_region = ''.join(e[1] for e in ia_entries)
    i_region = ib_region + ia_region
    print()
    print(i_region)

    cvt = {'1': '1', '0': '*'}
    ib_region_desc = '{'
    for entry in ib_entries:
        ib_region_desc += '[' + entry[0][0] + entry[0][1] + ' '*(len(entry[1])-4) + ']'
    ib_region_desc += '}'
    ia_region_desc = ''
    for entry in ia_entries:
        ia_region_desc += '[' + entry[0][0] + entry[0][1] + ' '*(len(entry[1])-4) + ']'
    ib_region = '*' + ''.join(''.join([cvt[c] for c in e[1]]) for e in ib_entries) + '0'
    i_region = ib_region + ia_region
    print()
    print(i_region)

    return i_region, ib_region_desc + ia_region_desc

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--readmemb-output", help="output file for readmemb")
    parser.add_argument("--machine", help="specify machine to encode")
    parser.add_argument("--readmemb-len", help="length of readmemb file")
    args = parser.parse_args()

    states, transitions = bb3_states, bb3_transitions

    if args.machine == 'bb2':
        print('bb2')
        states, transitions = bb2_states, bb2_transitions
    elif args.machine == 'bb3':
        print('bb3')
        states, transitions = bb3_states, bb3_transitions
    elif args.machine == 'bb4':
        print('bb4')
        states, transitions = bb4_states, bb4_transitions

    tape, desc = encode(states, transitions)

    if args.readmemb_output:
        with open(args.readmemb_output, 'w') as f:
            for i in range(int(args.readmemb_len)):
                sym = tape[i] if i < len(tape) else '0'
                sym_map = {
                    '0': '000',
                    '1': '001',
                    '*': '010',
                    'o': '100',
                    'i': '101'
                }
                f.write("{}\n".format(sym_map[sym]))
        print("wrote tape to {}".format(args.readmemb_output))
        print("encoded length {}, total length {}".format(len(tape), args.readmemb_len))

