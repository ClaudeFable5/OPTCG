-- AUTO-GENERATED: OP15-025 / 크로
-- rules_id=OP15-025 script_id=880002327 fingerprint=17348025fa7f58df872a1d134c974f05b3cc8620fc34ae8a857ba523d03c5679
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_OPPONENT_DON]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            schedule=[[THIS_TURN_END]],
            selector={
              count=1,
              filter={
                don_gte=3,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 캐릭터 1장에 상대의 코스트 에리어의 두웅!! 2장까지를 붙인다. 그 후, 이번 턴 종료 시, 상대의 두웅!!이 3장 이상 부여된 레스트 상태인 캐릭터 1장까지는 다음 상대의 리프레시 페이즈에 액티브가 되지 않는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP15-025]],
    schema_version=1,
  })
end
