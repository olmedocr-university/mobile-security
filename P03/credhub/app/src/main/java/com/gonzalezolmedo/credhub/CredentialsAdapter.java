package com.gonzalezolmedo.credhub;

import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.gonzalezolmedo.credhub.model.Credential;


public class CredentialsAdapter extends RecyclerView.Adapter<CredentialsAdapter.CredentialViewHolder> {
    private static Credential[] mCredentials;
    private static String TAG = "CredentialsAdapter";


    // Provide a suitable constructor (depends on the kind of dataset)
    CredentialsAdapter(Credential[] credentials) {
        mCredentials = credentials;
    }

    static void updateList(Credential[] credentials){
        mCredentials = credentials;
    }

    @NonNull
    @Override
    public CredentialViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.row_credential, parent, false);
        CredentialViewHolder viewHolder = new CredentialViewHolder(view);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull CredentialViewHolder holder, int position) {
        holder.bind(mCredentials[position]);
    }

    @Override
    public int getItemCount() {
        return mCredentials.length;
    }

    static class CredentialViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        private Credential mCredential;
        private TextView textView;
        private ImageView imageView;

        CredentialViewHolder(View itemView) {
            super(itemView);
            textView = itemView.findViewById(R.id.text_view);
            imageView = itemView.findViewById(R.id.image_view_icon);

            itemView.setOnClickListener(this);
        }

        private void bind(Credential credential){
            mCredential = credential;
            textView.setText(credential.getIdentifier());
            imageView.setImageDrawable(credential.getIcon());
        }

        @Override
        public void onClick(View v) {
            Log.i(TAG, "onClick: item " + mCredential.getIdentifier());

            Intent intent = new Intent(v.getContext(), EditRecordActivity.class);

            intent.putExtra("identifier", mCredential.getIdentifier());
            intent.putExtra("username", mCredential.getUsername());
            intent.putExtra("password", mCredential.getPassword());

            v.getContext().startActivity(intent);
        }
    }

}
