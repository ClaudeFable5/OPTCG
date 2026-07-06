-- AUTO-GENERATED: OP09-118 / 골 D. 로저
-- rules_id=OP09-118 script_id=880001214 fingerprint=1e39b8cd5e2be9954bbfabf79603f921debd08f4a897e4e542224e2e9033500b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                op=[[WIN_GAME]],
                player=[[YOU]],
              },
            },
            conditions={
              {
                count=0,
                op=[[ANY_LIFE_EQ]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[상대가 【블로커】를 발동했을 때, 자신 또는 상대의 라이프가 0장인 경우, 자신은 게임에서 승리한다.]],
        timings={
          [[ON_OPPONENT_BLOCKER_ACTIVATED]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP09-118]],
    schema_version=1,
  })
end
