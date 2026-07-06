-- AUTO-GENERATED: OP04-024 / 슈거
-- rules_id=OP04-024@8bb1c86f4bf5 script_id=880000515 fingerprint=8bb1c86f4bf57facf1706ecc3bdba34f822efdfc3c2e4f1f50a9e046672d8770
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[돈키호테 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 턴 동안】【턴 1회】상대가 캐릭터를 등장시켰을 때, 자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 상대의 캐릭터를 1장까지 레스트로 한다. 그 후, 이 캐릭터를 레스트 한다.]],
        timings={
          [[ON_OPPONENT_CHARACTER_PLAYED]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 코스트 4 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-024@8bb1c86f4bf5]],
    schema_version=1,
  })
end
