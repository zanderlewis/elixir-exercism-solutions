defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(volume_pair) do
    unit = elem(volume_pair, 0)
    mult = elem(volume_pair, 1)
    cond do
      unit == :cup -> {:milliliter, 240 * mult}
      unit == :fluid_ounce -> {:milliliter, 30 * mult}
      unit == :tablespoon -> {:milliliter, 15 * mult}
      unit == :teaspoon -> {:milliliter, 5 * mult}
      unit == :milliliter -> {:milliliter, mult}
      true -> nil
    end
  end

  def from_milliliter(volume_pair, unit) do
    mult = elem(volume_pair, 1)
    cond do
      unit == :cup -> {:cup, mult / 240}
      unit == :fluid_ounce -> {:fluid_ounce, mult / 30}
      unit == :tablespoon -> {:tablespoon, mult / 15}
      unit == :teaspoon -> {:teaspoon, mult / 5}
      unit == :milliliter -> {:milliliter, mult}
      true -> nil
    end
  end

  def convert(volume_pair, unit), do: from_milliliter(to_milliliter(volume_pair), unit)
end
