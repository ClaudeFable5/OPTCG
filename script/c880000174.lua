-- AUTO-GENERATED: OP01-051 / 유스타스 키드
-- rules_id=OP01-051 script_id=880000174 fingerprint=5e843e37bd1a5fe7b63ed0016d6b634382572fece8bcc0cbd84f959e99991f50
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-051]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            attacker_player=[[OPPONENT]],
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_ATTACK_TARGETS]],
            target_filter={
              card_type=[[CHARACTER]],
              name_neq=[[유스타스 키드]],
            },
          },
        },
        conditions={
          {
            op=[[SELF_STATE_IS]],
            state=[[RESTED]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【상대의 턴 동안】이 캐릭터가 레스트 상태인 경우, 상대는 캐릭터인 「유스타스 키드」 이외는 어택할 수 없다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이 캐릭터를 레스트할 수 있다: 자신의 패에서 코스트 3 이하인 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-051]],
    schema_version=1,
  })
end
