-- AUTO-GENERATED: OP04-111 / 헤라
-- rules_id=OP04-111 script_id=880000603 fingerprint=a4b85c098172e54d352e10996f06e5bc538577a896af07b6288e7bdcdf934588
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-111]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                name=[[샬롯 링링]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_OWN_CARD]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                exclude_self=true,
                trait=[[호미즈]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터 이외의 자신의 《호미즈》 특징을 가진 캐릭터 1장을 트래시에 놓고 이 캐릭터를 레스트할 수 있다: 자신의 캐릭터인 「샬롯 링링」을 1장까지 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-111]],
    schema_version=1,
  })
end
