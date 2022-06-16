package com.embun.cookingrecipeapp.ui;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.TextView;
import android.widget.Toast;

import com.embun.cookingrecipeapp.R;
import com.embun.cookingrecipeapp.data.RetrofitInstance;
import com.embun.cookingrecipeapp.data.model.GetRecipesResponse;
import com.embun.cookingrecipeapp.data.model.Recipe;
import com.embun.cookingrecipeapp.data.services.RetrofitServices;

import java.io.IOException;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class BookmarkFragment extends Fragment {
    ListView bookmarkList;
    TextView tvBookmark;
    private static ArrayAdapter<Recipe> bookmarkLVAdapter;
    private RetrofitServices retrofitServices;
    private static List<Recipe> recipes;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        retrofitServices = RetrofitInstance.getInstance().create(RetrofitServices.class);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.main, menu);
        super.onCreateOptionsMenu(menu, inflater);
        menu.findItem(R.id.addProduct).setVisible(true);

        MenuItem menuItem = menu.findItem(R.id.search);
        SearchView searchView = (SearchView) menuItem.getActionView();
        searchView.setQueryHint("Search your bookmark");

        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String s) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String s) {
                if(bookmarkLVAdapter!=null){
                    bookmarkLVAdapter.getFilter().filter(s);
                }
                return false;
            }
        });

    }
    /**
     * This will move the activity if one of the menu is clicked.
     * @param item menu item.
     * @return selected item.
     */
    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.search:
                Toast.makeText(getActivity(),"search clicked", Toast.LENGTH_SHORT).show();
                break;
            case R.id.addProduct:
                startActivity(new Intent(getActivity(), AddRecipeActivity.class));
                break;
            case R.id.aboutme:
                startActivity(new Intent(getActivity(), UserProfileActivity.class));
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
       View recipeView = inflater.inflate(R.layout.fragment_bookmark, container, false);
        bookmarkList = (ListView) recipeView.findViewById(R.id.lvBookmark);
        tvBookmark = (TextView) recipeView.findViewById(R.id.tvBookmark);

        Call<GetRecipesResponse> call = retrofitServices.getBookmark(LoginActivity.getLoggedAccount());
        call.enqueue(new Callback<GetRecipesResponse>() {
            @Override
            public void onResponse(Call<GetRecipesResponse> call, Response<GetRecipesResponse> response) {
                if(response.code()==200){
                    GetRecipesResponse resp = response.body();
                    recipes = resp.getRecipes();
                    if(recipes!=null){
                        bookmarkLVAdapter = new ArrayAdapter<Recipe>(getActivity(),android.R.layout.simple_list_item_1,
                                recipes);
                        bookmarkList.setAdapter(bookmarkLVAdapter);
                    }else {
                        tvBookmark.setText(resp.getMessage());
                    }

                }else{
                    try {
                        Toast.makeText(getActivity(), response.errorBody().string(),Toast.LENGTH_SHORT).show();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            @Override
            public void onFailure(Call<GetRecipesResponse> call, Throwable t) {

            }
        });

        /**
         * If the listview is clicked,
         * it will move to recipe detail activity
         * in RecipeDetailActivity.class
         */
        bookmarkList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                RecipeFragment.selectedRecipe = recipes.get(i);
                Intent intent = new Intent(getActivity(),RecipeDetailActivity.class);
                startActivity(intent);
            }
        });

        return  recipeView;
    }
}