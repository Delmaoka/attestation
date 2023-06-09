PGDMP     (                    {            DBAttestacion    15.1    15.1 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    17563    DBAttestacion    DATABASE     �   CREATE DATABASE "DBAttestacion" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "DBAttestacion";
                postgres    false            �            1259    17564    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    17567    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    214            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    215            �            1259    17568    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    17571    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    216            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    217            �            1259    17572    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    17575    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    218            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    219            �            1259    17576    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    17581    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    220            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    221            �            1259    17582    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    17588    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    17591    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    223            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    224            �            1259    17592    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    222            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    225            ~           2604    17593    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                       2604    17594    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    17595 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    17596 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �           2604    17597 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    222            �           2604    17598    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            '          0    17564    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public          postgres    false    214   ;       )          0    17568    image 
   TABLE DATA           :   COPY public.image (id, file_name, product_id) FROM stdin;
    public          postgres    false    216   q;       +          0    17572    orders 
   TABLE DATA           d   COPY public.orders (id, count, date_time, number, price, status, person_id, product_id) FROM stdin;
    public          postgres    false    218   
>       -          0    17576    person 
   TABLE DATA           ;   COPY public.person (id, login, password, role) FROM stdin;
    public          postgres    false    220   '>       /          0    17582    product 
   TABLE DATA           k   COPY public.product (id, date_time, description, price, seller, title, warehouse, category_id) FROM stdin;
    public          postgres    false    222   �>       0          0    17588    product_cart 
   TABLE DATA           A   COPY public.product_cart (id, person_id, product_id) FROM stdin;
    public          postgres    false    223   M@       ?           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    215            @           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 85, true);
          public          postgres    false    217            A           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 3, true);
          public          postgres    false    219            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 5, true);
          public          postgres    false    221            C           0    0    product_cart_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.product_cart_id_seq', 5, true);
          public          postgres    false    224            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 17, true);
          public          postgres    false    225            �           2606    17600    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    214            �           2606    17602    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    216            �           2606    17604    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    218            �           2606    17606    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    220            �           2606    17608    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    223            �           2606    17610    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    222            �           2606    17612 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    222            �           2606    17613 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    218    220    3212            �           2606    17618 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    222    3206    214            �           2606    17623 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    3214    218    222            �           2606    17628 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    3214    216    222            �           2606    17633 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    3214    223    222            �           2606    17638 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    3212    220    223            '   L   x�3�0�b�Ŧ�.l���b����b녽v\�ua��y�\�za�ܠ�e�ya���w_�Q������ �)(      )   �  x�=TK��:��l�a/ob0n�G����ܨ{)�J��65�&�	<��@I[�ʬ����~5⏬����g��y�QX� �\+HG���`��w������c�^sԷ��j���Z�Xr8d�&	�=&p�N
���3�
Y�b�D�{:Ձ���Ga*�~^!�Z���^/��|�n0�F�s=����h��e0<6pR��$��И�v���ʉg�"W?�b��>p��/�۞�;2`�v�{��a_�T��x��\0�|��{��P�P4By�҆��I��2ʠ!A����ڳ^��Y�%���^?T��2�*78V�K+�����s[u�M:������`Wf�kMĥ<l�^��D;$g����_!���l�w~���.+���o��6~ȕ���n_E~4��b��]t����룽���Rjf��%r���B1�BL���`G3�>�t8;��
n.e:*]'�^,7\�T�!g�k���Uӫ�ގ/v6�*z��o���;����Jo���jj������Ya����=�H�u�/=�)��;N̚�,!H����&�+��28��e�"c����P�Ii����vY_���f5��8@�*�y*�(�j�S{� |�?���2Y��J���F5��ꧠ�G��?��=����G_      +      x������ � �      -   �   x�5��
�0  ���;|���=5Sʻ!���l�2����|�Y9�� ��(��D�� �z>h��5FМ��e*��:e�zCﶌ^��j�(� O��*�Z�i9���%�G����u\�s��S϶�>�w�.2+t��x-)���`��!���B�]�1=      /   h  x�u�MN�0���)|�6�o��,�? ����R@�� ��)�!�
��Ti�"řy�7�Ǒ�)�t_��p'V$Ƅ6RVG��nDk7��>���ӡIu�C9�Qʬ�ѳ8��8��SD+7��y��@�s�(�z8XFO���h�G��I��\y�TBK�r���=GщСVBQJڸ�}�7�KJ��ˌ#�#��  �*�/N[*�Y�`qkt�n�1�k�OJ���I�@F]<cC�1�k��%x
w�����=��d��M�s�Y�fL���t"Fo�K&>�1��a��j���� �܏�s�׺OA�o���C�j���wnʢӻ��ZV��2z���Rѱo#��*���      0      x������ � �     