from manim import *


class BinomialSquare(Scene):
  def construct(self):
    # Define constants
    a = 2
    b = 1
    square_side = a + b

    # Create the main square
    main_square = Square(side_length=square_side).set_color(BLUE)

    # Add labels (a+b) on sides
    label_a_top = Text("a", font_size=24).next_to(main_square, UP).shift(LEFT * b / 2)
    label_b_top = Text("b", font_size=24).next_to(main_square, UP).shift(RIGHT * a / 2)
    label_a_left = Text("a", font_size=24).next_to(main_square, LEFT).shift(UP * b / 2)
    label_b_left = Text("b", font_size=24).next_to(main_square, LEFT).shift(DOWN * a / 2)

    # Create dividing lines
    v_line = Line(main_square.get_corner(UP) + DOWN * a,
                  main_square.get_corner(DOWN) + UP * b)
    h_line = Line(main_square.get_corner(LEFT) + RIGHT * a,
                  main_square.get_corner(RIGHT) + LEFT * b)

    # Create smaller squares and rectangles
    a_square = Square(side_length=a).set_color(RED).move_to(main_square.get_corner(UP + LEFT))
    b_square = Square(side_length=b).set_color(YELLOW).move_to(main_square.get_corner(DOWN + RIGHT))
    ab_rect1 = Rectangle(width=a, height=b).set_color(GREEN).next_to(a_square, RIGHT)
    ab_rect2 = Rectangle(width=b, height=a).set_color(GREEN).next_to(a_square, DOWN)

    # Animation sequence
    self.play(Create(main_square))
    self.play(Write(label_a_top), Write(label_b_top),
              Write(label_a_left), Write(label_b_left))
    self.play(Create(v_line), Create(h_line))
    self.play(FadeIn(a_square), FadeIn(b_square),
              FadeIn(ab_rect1), FadeIn(ab_rect2))

    # Formula text
    formula = MathTex(r"(a+b)^2 = a^2 + 2ab + b^2").to_edge(DOWN)
    self.play(Write(formula))

    self.wait(2)


if __name__ == "__main__":
  # Basic configuration
  config.pixel_height = 1080  # Set resolution height
  config.pixel_width = 1920  # Set resolution width
  config.frame_rate = 30  # Set frame rate
  config.output_file = "CombinedScene"  # Specify output filename
  config.disable_caching = True  # Disable caching

  # Set output directory using placeholder for Java replacement
  config.media_dir = "#(output_path)"  # IMPORTANT: Use the placeholder

  # Create and render the scene

  sence = BinomialSquare()
  sence.render()

  print(f"Scene rendering finished. Output in: {config.media_dir}")