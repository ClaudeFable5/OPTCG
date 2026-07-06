-- AUTO-GENERATED: ST07-003 / 샬롯 카타쿠리
-- rules_id=ST07-003 script_id=880001819 fingerprint=6abda8978922cc1f3dbd1ad05b771ead3ddad29a42c6dba207a94b6d48730cdc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST07-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            choose_player=true,
            count=1,
            destinations={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            op=[[LOOK_REORDER_LIFE_TOP]],
            player=[[ANY]],
          },
          {
            actions={
              {
                duration=[[THIS_TURN]],
                keyword=[[RUSH]],
                op=[[GAIN_KEYWORD]],
                selector={
                  count=1,
                  kind=[[SELF]],
                  mode=[[UP_TO]],
                  owner=[[YOU]],
                },
              },
            },
            conditions={
              {
                op=[[LIFE_LT_OPPONENT]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 또는 상대의 라이프 위에서 1장까지를 보고, 라이프 맨 위 나 아래로 되돌린다. 그 후, 자신의 라이프 수가 상대보다 적을 경우, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST07-003]],
    schema_version=1,
  })
end
