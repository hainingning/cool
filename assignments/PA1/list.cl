class List inherits A2I {
    item: Object;
    next: List;

    init(i: Object, n: List): List {
        {
            item <- i;
            next <- n;
            self;
        }
    };

    flatten(): String {
        let string: String <-
            case item of
                i: Int => i2a(i);
                s: String => s;
                o: Object => { abort(); ""; };
            esac
        in
            if (isvoid next)
            then {
                string;
            } else {
                string.concat(next.flatten());
            } fi
    };
};

class Main inherits IO {
    main(): Object {
        let hello: String <- "Hello World!",
            newline: String <- "\n",
            i: Int <- 42,
            nil: List,
            list: List <- (new List).init(hello, (new List).init(i, (new List).init(newline, nil)))
        in
        {
            out_string(list.flatten());
        }
    };
};